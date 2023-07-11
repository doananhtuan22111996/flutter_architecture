import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class FileExt {
  const FileExt._();

  static Future<File> bytesArray2File(
      Uint8List bytesArray, String filename) async {
    final tempDir = await getTemporaryDirectory();
    File file = await File('${tempDir.path}/$filename').create();
    file.writeAsBytesSync(bytesArray);
    return file;
  }
}
