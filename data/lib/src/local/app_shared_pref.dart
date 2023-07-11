import 'package:configs/configs.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

abstract class AppSharedPref extends GetxService {
  Future<void> setValue(String key, String value);

  Future<void> deleteValue(String key);

  Future<String> getValue(String key, String defaultValue);

  Future<bool> containsKey(String key);
}

class AppSharedPrefImpl extends AppSharedPref {
  // get storage
  late final _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
      resetOnError: true,
      sharedPreferencesName: BuildConfig.secureStorageName,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.unlocked_this_device,
      accountName: BuildConfig.secureStorageName,
    ),
  );

  @override
  Future<String> getValue(String key, String defaultValue) async {
    return await _storage.read(key: key) ?? defaultValue;
  }

  @override
  Future<void> setValue(String key, String value) {
    return _storage.write(key: key, value: value);
  }

  @override
  Future<void> deleteValue(String key) {
    return _storage.delete(key: key);
  }

  @override
  Future<bool> containsKey(String key) {
    return _storage.containsKey(key: key);
  }
}
