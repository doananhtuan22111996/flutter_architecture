import 'dart:convert';
import 'dart:io';

import 'package:recase/recase.dart';

// TODO [remove] this file when create new project.
/// Config env for web.

const _webJsonConfigFilePath = '.env/config.web.json';
const _buildConfigClassFilePath = 'lib/src/generated/build_config.g.dart';

void main(List<String>? args) {
  if (args?.isNotEmpty == true && args?.first == 'create') {
    _SampleEnvGenerator(outputFilePath: _webJsonConfigFilePath, configJson: {})
        .execute();
    return;
  }
  Map<String, dynamic>? configJson;
  configJson = readJsonFile(_webJsonConfigFilePath);
  _genEnv(configJson);
}

void _genEnv(Map<String, dynamic> configJson) {
  genDartNDefineFile(configJson);
}

Map<String, dynamic> readJsonFile(String filePath) {
  final mandatoryFile = File(filePath);
  var fileContent = mandatoryFile.readAsStringSync();
  fileContent = fileContent.replaceAll(RegExp('.+// .+\n'), '');
  return jsonDecode(fileContent);
}

void genDartNDefineFile(devConfigJson) {
  _DartDefineGenerator(
          outputFilePath: _buildConfigClassFilePath, configJson: devConfigJson)
      .execute();
}

abstract class _FileGenerator {
  final String outputFilePath;
  final Map<String, dynamic> configJson;
  final bool? isOverride;

  _FileGenerator({
    required this.outputFilePath,
    required this.configJson,
    this.isOverride = true,
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
      content += '${key.snakeCase.toUpperCase()}=${configJson[key]}\n';
    });
    return content;
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
    if (!configJson.containsKey('flavor')) {
      throw Exception(
          'Please update config file - flavor is required in dartDefine');
    }
    return true;
  }
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
      "apiDomain": "Todo input here!",
      "secureStorageName": "Todo input here!",
      "basicToken": "Todo input here!",
      "apiKey": "Todo input here!",
      "appId": "Todo input here!",
      "messagingSenderId": "Todo input here!",
      "projectId": "Todo input here!"
    }
    """;
  }
}
