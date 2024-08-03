import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:recase/recase.dart';

const _devJsonConfigFilePath = '.env/config.dev.json';
const _prodJsonConfigFilePath = '.env/config.prod.json';
const _appLibRootPath = '../app/lib';
const _androidRootPath = '../app/android';
const _androidSrcPath = '../app/android/app/src';
const _keyStoreAndroidFilePath = '../app/android/key.properties';
const _nativeDefineAndroidFilePath = '../app/android/native.define.properties';
const _iosRootPath = '../app/ios';
const _nativeDefineIOSFilePath = '../app/ios/Flutter/NativeGenerated.xcconfig';
const _developmentCerIOSFilePath =
    '../app/ios/Flutter/DevelopmentCerGenerated.xcconfig';
const _distributionCerIOSFilePath =
    '../app/ios/Flutter/DistributionCerGenerated.xcconfig';
const _buildConfigClassFilePath = 'lib/src/generated/build_config.g.dart';

void main(List<String>? args) {
  if (args?.isEmpty == true) {
    return;
  }
  if (args?.first == 'create') {
    _SampleEnvGenerator(outputFilePath: _devJsonConfigFilePath, configJson: {})
        .execute();
    _SampleEnvGenerator(outputFilePath: _prodJsonConfigFilePath, configJson: {})
        .execute();
    return;
  }
  Map<String, dynamic>? configJson;
  if (args?.first == 'dev') {
    configJson = readJsonFile(_devJsonConfigFilePath);
  } else if (args?.first == 'prod') {
    configJson = readJsonFile(_prodJsonConfigFilePath);
  }
  if (configJson == null) {
    return;
  }
  _genEnv(configJson);
}

void _genEnv(Map<String, dynamic> devConfigJson) {
  if (!devConfigJson.containsKey('certificate')) {
    throw Exception('Please update config file - certificate not found');
  }
  if (!devConfigJson.containsKey('nativeDefine')) {
    throw Exception('Please update config file - nativeDefine not found');
  }
  if (!devConfigJson.containsKey('dartDefine')) {
    throw Exception('Please update config file - dartDefine not found');
  }
  genCertificateFile(devConfigJson['certificate']);
  genNativeDefineFile(devConfigJson['nativeDefine']);
  genDartNDefineFile(devConfigJson['dartDefine']);
}

Map<String, dynamic> readJsonFile(String filePath) {
  final mandatoryFile = File(filePath);
  var fileContent = mandatoryFile.readAsStringSync();
  fileContent = fileContent.replaceAll(RegExp('.+// .+\n'), '');
  return jsonDecode(fileContent);
}

void genCertificateFile(Map<String, dynamic> certificateJson) {
  if (!certificateJson.containsKey('android')) {
    throw Exception(
        'Please update config file - certificate -> android not found');
  }
  if (!certificateJson.containsKey('iOS')) {
    throw Exception('Please update config file - certificate -> iOS not found');
  }
  if (!(certificateJson['iOS'] as Map<String, dynamic>)
      .containsKey('development')) {
    throw Exception(
        'Please update config file - certificate -> iOS development not found');
  }
  if (!(certificateJson['iOS'] as Map<String, dynamic>)
      .containsKey('distribution')) {
    throw Exception(
        'Please update config file - certificate -> iOS distribution not found');
  }
  final androidKeystoreGenerator = _AndroidKeystoreGenerator(
    outputFilePath: _keyStoreAndroidFilePath,
    configJson: certificateJson['android'],
    excludeKeys: ['storeKey'],
  );
  androidKeystoreGenerator.execute();
  androidKeystoreGenerator.executeKeyStoreFile();
  androidKeystoreGenerator.executeKeyGoogleJson();
  _IOSCertificateGenerator(
    outputFilePath: _developmentCerIOSFilePath,
    configJson: certificateJson['iOS']['development'],
    prefix: 'cerDev',
    excludeKeys: ['exportOptions'],
  ).execute();
  final iOSCertificateGenerator = _IOSCertificateGenerator(
    outputFilePath: _distributionCerIOSFilePath,
    configJson: certificateJson['iOS']['distribution'],
    prefix: 'cerDis',
    excludeKeys: ['exportOptions'],
  );
  iOSCertificateGenerator.execute();
  // TODO if support for IOS -> Please open line code below
  // iOSCertificateGenerator.executeExportOptionsFile();
}

void genNativeDefineFile(Map<String, dynamic> nativeDefineJson) {
  _NativeDefineGenerator(
    outputFilePath: _nativeDefineAndroidFilePath,
    configJson: nativeDefineJson,
  ).execute();
  _NativeDefineGenerator(
    outputFilePath: _nativeDefineIOSFilePath,
    configJson: nativeDefineJson,
  ).execute();
}

void genDartNDefineFile(devConfigJson) {
  final dartDefineGenerator = _DartDefineGenerator(
      outputFilePath: _buildConfigClassFilePath, configJson: devConfigJson);
  dartDefineGenerator.execute();
  dartDefineGenerator.executeFirebaseOptionsFile();
}

abstract class _FileGenerator {
  final String outputFilePath;
  final Map<String, dynamic> configJson;
  final String? prefix;
  final bool? isOverride;
  final List<String>? excludeKeys;

  _FileGenerator({
    required this.outputFilePath,
    required this.configJson,
    this.prefix,
    this.isOverride = true,
    this.excludeKeys,
  });

  void execute() {
    final mandatoryFile = File(outputFilePath);
    if (!mandatoryFile.existsSync()) {
      mandatoryFile.createSync(recursive: true);
      if (isOverride == false) {
        mandatoryFile.writeAsStringSync(formatContent());
      }
    }
    if (isOverride == true) {
      mandatoryFile.writeAsStringSync(formatContent());
    }
  }

  bool validate();

  String formatContent() {
    validate();
    String content = '';
    configJson.forEach((key, value) {
      if (excludeKeys?.contains(key) == true) {
        return;
      }
      if (prefix?.isNotEmpty == true) {
        '${prefix}_$key'.snakeCase.toUpperCase();
        content +=
            '${'${prefix}_$key'.snakeCase.toUpperCase()}=${configJson[key]}\n';
      } else {
        content += '${key.snakeCase.toUpperCase()}=${configJson[key]}\n';
      }
    });
    return content;
  }
}

class _AndroidKeystoreGenerator extends _FileGenerator {
  _AndroidKeystoreGenerator({
    required super.outputFilePath,
    required super.configJson,
    super.excludeKeys,
  }) : super();

  @override
  bool validate() {
    if (!configJson.containsKey('storePassword') ||
        !configJson.containsKey('keyPassword') ||
        !configJson.containsKey('keyAlias') ||
        !configJson.containsKey('storeFile')) {
      throw Exception('Please update config file - Android key store');
    }
    return true;
  }

  void executeKeyStoreFile() async {
    if (configJson.containsKey('storeKey') == false) {
      return;
    }
    final fileName = configJson['storeFile'].toString().split('../')[1];
    try {
      // split key will change because it depend [storeFile] dir
      Uint8List bytes = base64.decode(configJson['storeKey']);
      File file = File('$_androidRootPath/$fileName');
      await file.writeAsBytes(bytes);
    } catch (e) {
      throw Exception('executeKeyStoreFile - ${e.toString()} --- $fileName');
    }
  }

  void executeKeyGoogleJson() async {
    if (configJson.containsKey('googleJson') == false ||
        configJson.containsKey('folder') == false) {
      return;
    }
    const fileName = 'google-services.json';
    try {
      final directory = Directory('$_androidSrcPath/${configJson['folder']}');
      if (!directory.existsSync()) {
        directory.createSync();
      }
      // split key will change because it depend [storeFile] dir
      Uint8List bytes = base64.decode(configJson['googleJson']);
      File file = File('${directory.path}/$fileName');
      await file.writeAsBytes(bytes);
    } catch (e) {
      throw Exception('executeKeyGoogleJson - ${e.toString()} --- $fileName');
    }
  }
}

class _IOSCertificateGenerator extends _FileGenerator {
  _IOSCertificateGenerator({
    required super.outputFilePath,
    required super.configJson,
    required String prefix,
    super.excludeKeys,
  }) : super(prefix: prefix);

  @override
  bool validate() {
    if (!configJson.containsKey('codeSignIdentity') ||
        !configJson.containsKey('developmentTeam') ||
        !configJson.containsKey('provisioningProfileSpecifier')) {
      throw Exception('Please update config file - iOS certificate');
    }
    return true;
  }

  void executeExportOptionsFile() async {
    if (configJson.containsKey('exportOptions') == false) {
      return;
    }
    try {
      Uint8List bytes = base64.decode(configJson['exportOptions']);
      File file = File('$_iosRootPath/ExportOptions.plist');
      await file.writeAsBytes(bytes);
    } catch (e) {
      throw Exception('executeExportOptionsFile - ${e.toString()}');
    }
  }
}

class _NativeDefineGenerator extends _FileGenerator {
  _NativeDefineGenerator(
      {required super.outputFilePath, required super.configJson});

  @override
  bool validate() {
    if (!configJson.containsKey('appName') ||
        !configJson.containsKey('appBundleId')) {
      throw Exception(
          'Please update config file - appName or appBundleId is required in nativeDefine');
    }
    return true;
  }
}

class _DartDefineGenerator extends _FileGenerator {
  _DartDefineGenerator(
      {required super.outputFilePath, required super.configJson});

  @override
  String formatContent() {
    String content = 'class BuildConfig {\n';
    content += '  BuildConfig._();\n';
    configJson.forEach((key, value) {
      content +=
          '  static const String ${key.camelCase} = String.fromEnvironment(\'$key\');\n';
    });
    content += '}';
    return content;
  }

  @override
  bool validate() {
    if (!configJson.containsKey('flavor') ||
        !configJson.containsKey('firebaseOptions')) {
      throw Exception(
          'Please update config file - flavor is required in dartDefine');
    }
    return true;
  }

  void executeFirebaseOptionsFile() async {
    if (configJson.containsKey('firebaseOptions') == false) {
      return;
    }
    const fileName = "firebase_options.dart";
    try {
      // split key will change because it depend [storeFile] dir
      Uint8List bytes = base64.decode(configJson['firebaseOptions']);
      File file = File('$_appLibRootPath/$fileName');
      await file.writeAsBytes(bytes);
    } catch (e) {
      throw Exception(
          'executeFirebaseOptionsFile - ${e.toString()} --- $fileName');
    }
  }

  String get flavor => validate() ? configJson['flavor'] : '';
}

class _SampleEnvGenerator extends _FileGenerator {
  _SampleEnvGenerator(
      {required super.outputFilePath, required super.configJson})
      : super(isOverride: false);

  @override
  bool validate() {
    return true;
  }

  @override
  String formatContent() {
    return """
    {
      "certificate": {
        "android": {
          "folder": "Android flavor folder (dev, staging, prod)",
          "storePassword": "keyPassword",
          "keyPassword": "keyPassword",
          "keyAlias": "keyAlias",
          "storeFile": "path store file",
          "storeKey": "convert store file to base64",
          "googleJson": "convert google file to base64"
        },
        "iOS": {
          "development": {
            "codeSignIdentity": "iPhone Developer",
            "developmentTeam": "developmentTeam",
            "provisioningProfileSpecifier": "Sample Dev Provisioning",
            "exportOptions": "Sample Dev Provisioning (convert exportOptions file to Base64)"
          },
          "distribution": {
            "codeSignIdentity": "iPhone Distribution",
            "developmentTeam": "developmentTeam",
            "provisioningProfileSpecifier": "Sample Dev App Store Provisioning",
            "exportOptions": "Sample Dev Provisioning (convert exportOptions file to Base64)"
          }
        }
      },
      "dartDefine": {
        "flavor": "dev",
        "apiDomain": "https://sample.io",
        "secureStorageName": "the name for share preference"
        "firebaseOptions": "the file for config firebase platform"
      },
      "nativeDefine": {
        "appName": "Sample",
        "appBundleId": "io.root.sample"
      }
    }
    """;
  }
}
