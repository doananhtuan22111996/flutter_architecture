import 'package:configs/configs.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AppSharedPref {
  Future<void> onInit();

  Future<void> setString(String key, String value);

  Future<void> setInt(String key, int value);

  Future<void> setStringList(String key, List<String> value);

  Future<void> setDouble(String key, double value);

  Future<bool> deleteValue(String key);

  String getString(String key, String defaultValue);

  int getInt(String key, int defaultValue);

  bool getBool(String key, bool defaultValue);

  double getDouble(String key, double defaultValue);

  List<String> getStringList(String key, List<String> defaultValue);

  bool containsKey(String key);
}

class AppSharedPrefImpl extends AppSharedPref {
  // get storage
  late final SharedPreferences _storage;

  @override
  Future<void> onInit() async {
    SharedPreferences.setPrefix(BuildConfig.secureStorageName);
    _storage = await SharedPreferences.getInstance();
  }

  @override
  String getString(String key, String defaultValue) {
    return _storage.getString(key) ?? defaultValue;
  }

  @override
  Future<bool> deleteValue(String key) {
    return _storage.remove(key);
  }

  @override
  bool containsKey(String key) {
    return _storage.containsKey(key);
  }

  @override
  bool getBool(String key, bool defaultValue) {
    return _storage.getBool(key) ?? defaultValue;
  }

  @override
  double getDouble(String key, double defaultValue) {
    return _storage.getDouble(key) ?? defaultValue;
  }

  @override
  int getInt(String key, int defaultValue) {
    return _storage.getInt(key) ?? defaultValue;
  }

  @override
  List<String> getStringList(String key, List<String> defaultValue) {
    return _storage.getStringList(key) ?? defaultValue;
  }

  @override
  Future<void> setDouble(String key, double value) {
    return _storage.setDouble(key, value);
  }

  @override
  Future<void> setInt(String key, int value) {
    return _storage.setInt(key, value);
  }

  @override
  Future<void> setStringList(String key, List<String> value) {
    return _storage.setStringList(key, value);
  }

  @override
  Future<void> setString(String key, String value) {
    return _storage.setString(key, value);
  }
}
