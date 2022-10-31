import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

abstract class AppSharedPref extends GetxService {
  void setValue(String key, String value);
  Future<void> deleteValue(String key);
  Future<String> getValue(String key, String defaultValue);
  Future<bool> containsKey(String key);
}

class AppSharedPrefImpl extends AppSharedPref {
  // get storage
  late final _storage = const FlutterSecureStorage();

  IOSOptions _getIOSOptions() => const IOSOptions(
        accountName: 'mobile@geekup.vn',
      );

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true, resetOnError: true);

  @override
  Future<String> getValue(String key, String defaultValue) async {
    return await _storage.read(
          key: key,
          iOptions: _getIOSOptions(),
          aOptions: _getAndroidOptions(),
        ) ??
        defaultValue;
  }

  @override
  void setValue(String key, String value) {
    _storage.write(
        key: key,
        value: value,
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions());
  }

  @override
  Future<void> deleteValue(String key) async {
    return await _storage.delete(
        key: key, iOptions: _getIOSOptions(), aOptions: _getAndroidOptions());
  }

  @override
  Future<bool> containsKey(String key) async {
    return await _storage.containsKey(
        key: key, iOptions: _getIOSOptions(), aOptions: _getAndroidOptions());
  }
}
