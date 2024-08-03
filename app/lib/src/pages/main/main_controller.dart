import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:app/src/components/main/toast/app_toast_base_builder.dart';
import 'package:app/src/pages/badge/badge_controller.dart';
import 'package:app/src/pages/login/login_controller.dart';
import 'package:app/src/pages/tabBar/tab_bar_controller.dart';
import 'package:app/src/pages/toast/toast_controller.dart';
import 'package:app/src/pages/tooltip/tooltip_controller.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/src/components/main/appBar/app_bar_base_builder.dart';
import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/page/app_main_page_base_builder.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/pages/avatar/avatar_controller.dart';
import 'package:app/src/pages/button/button_controller.dart';
import 'package:app/src/pages/datePicker/date_picker_controller.dart';
import 'package:app/src/pages/dialog/dialog_controller.dart';
import 'package:app/src/pages/progress/progress_controller.dart';
import 'package:app/src/pages/selectionControl/selection_control_controller.dart';
import 'package:app/src/pages/textField/text_field_controller.dart';

import '../../exts/R.dart';

part 'main_binding.dart';

part 'main_page.dart';

class MainController extends GetxController {
  late final AppUseCase _appUseCase;

  MainController(this._appUseCase);

  final List<LanguageModel> languages = [
    LanguageModel(
      countryCode: AppLanguageKey.en.countryCode,
      langCode: AppLanguageKey.en.langCode,
      name: R.strings.englishLanguage,
    ),
    LanguageModel(
      countryCode: AppLanguageKey.vi.countryCode,
      langCode: AppLanguageKey.vi.langCode,
      name: R.strings.vietNamLanguage,
    )
  ];

  final List<String> themes = [ThemeMode.light.name, ThemeMode.dark.name];

  Rx<String> langCode = Rx<String>(Get.deviceLocale!.languageCode);
  Rx<String> theme = Rx<String>(
      Get.isDarkMode == true ? ThemeMode.dark.name : ThemeMode.light.name);

  @override
  void onInit() {
    super.onInit();
    executeGetLanguage();
    executeGetTheme();
  }

  void executeGetLanguage() async {
    try {
      final langCode = await _appUseCase.getLanguageCode();
      final deviceLangCode = Get.deviceLocale!.languageCode;
      executeUpdateLanguage(langCode.isEmpty ? deviceLangCode : langCode);
    } on AppException catch (e) {
      AppToastWidget(
              title: 'Multiple Languages',
              message: e.message,
              appToastType: AppToastType.error)
          .show();
    }
  }

  void executeUpdateLanguage(String langCode) async {
    try {
      this.langCode.value = langCode;
      final languageModel =
          languages.firstWhere((element) => element.langCode == langCode);
      await _appUseCase.setLanguageCode(languageModel.langCode);
      Get.updateLocale(
          Locale(languageModel.langCode, languageModel.countryCode));
    } on AppException catch (e) {
      AppToastWidget(
              title: 'Multiple Languages',
              message: e.message,
              appToastType: AppToastType.error)
          .show();
    }
  }

  void executeGetTheme() async {
    try {
      final theme = await _appUseCase.getThemeMode();
      final deviceTheme =
          Get.isDarkMode ? ThemeMode.dark.name : ThemeMode.light.name;
      executeUpdateTheme(theme.isEmpty ? deviceTheme : theme);
    } on AppException catch (e) {
      AppToastWidget(
              title: 'Theme Mode',
              message: e.message,
              appToastType: AppToastType.error)
          .show();
    }
  }

  void executeUpdateTheme(String theme) async {
    try {
      this.theme.value = theme;
      final themeMode =
          ThemeMode.values.firstWhere((element) => element.name == theme);
      await _appUseCase.setThemeMode(theme);
      Get.changeThemeMode(themeMode);
      Get.changeTheme(themeMode == ThemeMode.dark
          ? AppThemeData.darkTheme
          : AppThemeData.lightTheme);
    } on AppException catch (e) {
      AppToastWidget(
              title: 'Theme Mode',
              message: e.message,
              appToastType: AppToastType.error)
          .show();
    }
  }
}
