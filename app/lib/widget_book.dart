import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:utilities/utilities.dart';

import 'firebase_options.dart';
import 'src/components/main/loading/app_loading_overlay_indicator.dart';
import 'src/config/app_theme.dart';
import 'src/exts/R.dart';
import 'src/exts/fsplash.dart';
import 'src/routes/app_pages.dart';

// TODO [remove] this file when create new project.
/// The Widget book only use for skeleton or component library on Web. The Web platform run faster than Android and IOS.
/// It'll remove for new project.
/// Only [Dev] environment

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Fsplash.preserve(widgetsBinding: WidgetsBinding.instance);
  await _configFirebase();
  Fcryptography.enable();
  await Hive.initFlutter();
  Fsplash.remove();

  // Init all dependencies before render main app
  await DataProvider.serviceInject();
  await DataProvider.inject();
  DomainProvider.inject();
  runApp(const MyApp());
}

Future<void> _configFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
