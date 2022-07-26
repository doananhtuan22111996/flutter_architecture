import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/config/theme/app_theme.dart';
import 'data/entities/base_vo.dart';
import 'data/local/app_hive_db.dart';
import 'data/local/app_shared_pref.dart';
import 'data/network/network_service.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/auth_use_case.dart';
import 'domain/usecases/user_use_case.dart';
import 'services/environment_service.dart';
import 'services/localization_service.dart';
import 'app/routes/app_pages.dart';
import 'services/theme_service.dart';

part 'app/bindings/app_binding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final localization = Get.put<LocalizationService>(LocalizationService());
    final themeMode = Get.put<ThemeService>(ThemeService());

    return GetMaterialApp.router(
      debugShowCheckedModeBanner: true,
      enableLog: true,
      locale: localization.defaultLanguage,
      fallbackLocale: localization.fallbackLocale,
      translations: localization,
      translationsKeys: localization.keys,
      theme: AppThemeData.lightTheme,
      darkTheme: AppThemeData.dartTheme,
      themeMode: themeMode.theme,
      getPages: AppPages.routes,
      initialBinding: AppBinding(),
      smartManagement: SmartManagement.onlyBuilder,
    );
  }
}
