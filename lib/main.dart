import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/config/theme/app_theme.dart';
import 'data/entities/base_vo.dart';
import 'data/local/app_hive_db.dart';
import 'data/network/network_service.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/auth_use_case.dart';
import 'domain/usecases/user_use_case.dart';
import 'services/app_service.dart';
import 'services/environment_service.dart';
import 'app/routes/app_pages.dart';

part 'app/bindings/app_binding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  if (kDebugMode) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  } else {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  }
  await GetStorage.init();
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appService = Get.put<AppService>(AppServiceImpl());

    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      enableLog: true,
      locale: appService.localization.defaultLanguage,
      fallbackLocale: appService.localization.fallbackLocale,
      translations: appService.localization,
      translationsKeys: appService.localization.keys,
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: appService.theme.themeMode,
      getPages: AppPages.routes,
      initialRoute: Routes.home,
      initialBinding: AppBinding(),
    );
  }
}
