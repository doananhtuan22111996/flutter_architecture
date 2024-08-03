import 'dart:convert';
import 'dart:io';

const _webJsonConfigFilePath = './configs/.env/config.web.json';

// TODO [remove] this file when create new project.

void main(List<String>? args) async {
  Map<String, dynamic>? configJson = readJsonFile(_webJsonConfigFilePath);
  final dartDefine = _readDartDefine(configJson);
  List<String> arguments = [
    'run',
    '-t',
    'lib/widget_book.dart',
    dartDefine,
    '-d',
    'chrome'
  ];

  print('CMD: fvm flutter ${arguments.join(' ')}');
  final process = await Process.start(
    'bash',
    ['-c', 'fvm flutter ${arguments.join(' ')}'],
    workingDirectory: './app',
  );
  process.stdout.transform(utf8.decoder).listen((data) {
    print(data);
  });
  process.stderr.transform(utf8.decoder).listen((data) {
    print(data);
  });
  final exitCode = await process.exitCode;
  if (exitCode != 0) {
    throw Exception('Script failed with exit code: $exitCode');
  }
}

String _readDartDefine(Map<String, dynamic> configJson) {
  Map<String, dynamic> dartDefineJson = configJson;
  String dartDefine = '';
  dartDefineJson.forEach((key, value) {
    if (key != "firebaseOptions") {
      dartDefine += '--dart-define $key=$value ';
    }
  });
  return dartDefine.trim();
}

Map<String, dynamic> readJsonFile(String filePath) {
  final mandatoryFile = File(filePath);
  var fileContent = mandatoryFile.readAsStringSync();
  fileContent = fileContent.replaceAll(RegExp('.+// .+\n'), '');
  return jsonDecode(fileContent);
}
