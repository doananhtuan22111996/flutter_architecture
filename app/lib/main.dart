import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:resources/resources.dart';
import 'package:utilities/utilities.dart';

import 'src/components/main/loading/app_loading_overlay_indicator.dart';
import 'src/config/app_theme.dart';
import 'src/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Fsplash.preserve(widgetsBinding: WidgetsBinding.instance);
  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  if (kDebugMode) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  } else {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  }
  Fcryptography.enable();
  await GetStorage.init();
  await Hive.initFlutter();
  Fsplash.remove();

  // Init all dependencies before render main app
  await DataProvider.serviceInject();
  await DataProvider.inject();
  DomainProvider.inject();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppLoadingOverlayWidget.configure(context);

    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      enableLog: true,
      locale: Get.deviceLocale,
      supportedLocales: R.appLocalizationDelegate.supportedLocales,
      localizationsDelegates: const [
        R.appLocalizationDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: AppThemeData.lightTheme,
      darkTheme: AppThemeData.darkTheme,
      themeMode: ThemeMode.system,
      getPages: AppPages.routes,
      initialRoute: Routes.main,
      // This is Getx's error. Actually [initialBinding] run after [initialRoute] so throw dependency not found
      // initialBinding: AppBinding(),
      smartManagement: SmartManagement.full,
      builder: AppLoadingOverlayWidget.init(),
    );
  }
}
