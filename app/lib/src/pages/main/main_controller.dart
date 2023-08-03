import 'package:app/src/pages/badge/badge_controller.dart';
import 'package:app/src/pages/home/home_controller.dart';
import 'package:app/src/pages/tabBar/tab_bar_controller.dart';
import 'package:app/src/pages/tooltip/tooltip_controller.dart';
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
import 'package:app/src/pages/hospital/hospital_controller.dart';
import 'package:app/src/pages/hospitalLocal/hospital_local_controller.dart';
import 'package:app/src/pages/progress/progress_controller.dart';
import 'package:app/src/pages/selectionControl/selection_control_controller.dart';
import 'package:app/src/pages/textField/text_field_controller.dart';
import 'package:resources/resources.dart';

part 'main_binding.dart';

part 'main_page.dart';

class MainController extends GetxController {
  Rxn<String> lnCode = Rxn<String>();
  RxBool isDarkMode = false.obs;

  void executeGetLanguage() {
    // lnCode.value = _authUseCase.languageCode();
  }

  void executeGetTheme() {
    // isDarkMode.value = _authUseCase.isDarkTheme();
  }

  void executeUpdateLanguage(String code) {
    lnCode.value = code;
    // _authUseCase.saveLanguageCode(code);
  }

  void executeChangeThemeMode(ThemeMode themeMode) {
    isDarkMode.value = themeMode == ThemeMode.dark;
    // _authUseCase.changeThemeMode(themeMode);
  }
}
