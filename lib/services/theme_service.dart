import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../data/local/app_pref_key.dart';

class ThemeService extends GetxController {
  final _box = GetStorage();

  ThemeService();

  ThemeMode get theme => _loadTheme() ? ThemeMode.dark : ThemeMode.light;

  bool _loadTheme() => _box.read(AppPrefKey.theme) ?? false;

  void saveTheme(bool isDarkMode) => _box.write(AppPrefKey.theme, isDarkMode);

  void changeTheme(ThemeData theme) => Get.changeTheme(theme);

  void changeThemeMode(ThemeMode themeMode) => Get.changeThemeMode(themeMode);
}
