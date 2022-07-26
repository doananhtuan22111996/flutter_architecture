import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AppSharedPref extends GetxService {
  // get storage
  late final _storage = const FlutterSecureStorage();

  IOSOptions _getIOSOptions() => const IOSOptions(
        accountName: 'mobile@geekup.vn',
      );

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  Future<String> getValue(String key, String defaultValue) async {
    return await _storage.read(
          key: key,
          iOptions: _getIOSOptions(),
          aOptions: _getAndroidOptions(),
        ) ??
        defaultValue;
  }

  void setValue(String key, String value) {
    _storage.write(
        key: key,
        value: value,
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions());
  }

  Future<bool> containsKey(String key) async {
    return await _storage.containsKey(
        key: key, iOptions: _getIOSOptions(), aOptions: _getAndroidOptions());
  }
}
