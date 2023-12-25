// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
//
// abstract class ThemeService extends GetxService {
//   ThemeMode get themeMode;
//   void saveTheme(bool isDarkMode);
//   void changeTheme(ThemeData theme);
//   void changeThemeMode(ThemeMode themeMode);
// }
//
// class ThemeServiceImpl extends ThemeService {
//   final _box = GetStorage();
//
//   ThemeServiceImpl();
//
//   @override
//   ThemeMode get themeMode => _loadTheme() ? ThemeMode.dark : ThemeMode.light;
//
//   @override
//   void saveTheme(bool isDarkMode) => _box.write(AppPrefKey.theme, isDarkMode);
//
//   @override
//   void changeTheme(ThemeData theme) => Get.changeTheme(theme);
//
//   @override
//   void changeThemeMode(ThemeMode themeMode) => Get.changeThemeMode(themeMode);
//
//   bool _loadTheme() => _box.read(AppPrefKey.theme) ?? false;
// }
