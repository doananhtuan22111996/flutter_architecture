// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// import '../app/config/theme/app_theme.dart';
// import '../app/config/translations/strings_enum.dart';
// import '../data/local/app_pref_key.dart';
// import '../data/local/app_shared_pref.dart';
// import 'environment_service.dart';

// part 'localization_service.dart';

// part 'theme_service.dart';

// abstract class AppService extends GetxService {
//   LocalizationService get localization;

//   ThemeService get theme;

//   String languageCode();

//   void saveLanguageCode(String code);

//   bool isDarkTheme();

//   void changeThemeMode(ThemeMode themeMode);

//   Future<bool> isLoggedIn();

//   void forceLogout();
// }

// class AppServiceImpl extends AppService {
//   late final AppSharedPref _appSharedPref;
//   late final LocalizationService _localization;
//   late final ThemeService _theme;
//   late final EnvironmentService _env;

//   @override
//   void onInit() {
//     super.onInit();
//     _localization = Get.put<LocalizationService>(_LocalizationServiceImpl());
//     _appSharedPref = Get.put<AppSharedPref>(AppSharedPrefImpl());
//     _theme = Get.put<ThemeService>(ThemeServiceImpl());
//   }

//   @override
//   LocalizationService get localization => _localization;

//   @override
//   ThemeService get theme => _theme;

//   @override
//   String languageCode() {
//     return _localization.defaultLanguage?.languageCode ?? 'en';
//   }

//   @override
//   void saveLanguageCode(String code) {
//     _localization.saveLocalization(code);
//     _localization.changeLocalization(code);
//   }

//   @override
//   bool isDarkTheme() {
//     return _theme.themeMode == ThemeMode.dark;
//   }

//   @override
//   void changeThemeMode(ThemeMode themeMode) {
//     _theme.saveTheme(themeMode == ThemeMode.dark);
//     _theme.changeThemeMode(themeMode);
//     _theme.changeTheme(
//       themeMode == ThemeMode.dark
//           ? AppThemeData.darkThemeData
//           : AppThemeData.lightThemeData,
//     );
//   }

//   @override
//   Future<bool> isLoggedIn() async {
//     return (await _appSharedPref.getValue(AppPrefKey.token, '')).isNotEmpty;
//   }

//   // TODO handle force logout
//   @override
//   void forceLogout() async {
//     await _appSharedPref.deleteValue(AppPrefKey.token);
//     await _appSharedPref.deleteValue(AppPrefKey.refreshToken);
//   }
// }
