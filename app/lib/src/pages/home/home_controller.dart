import 'package:app/src/components/main/appBar/app_bar_base_builder.dart';
import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/dialog/app_dialog_base_builder.dart';
import 'package:app/src/components/main/loading/app_loading_indicator.dart';
import 'package:app/src/components/main/page/app_main_page_base_builder.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/exts/app_exts.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

import '../../components/main/app_snack_bar_widget.dart';

part 'home_binding.dart';

part 'home_page.dart';

class HomeController extends GetxController {
  late final LoginUseCase _loginUseCase;

  HomeController(this._loginUseCase);

  Rxn<TokenModel> tokenModel = Rxn<TokenModel>();

  Rxn<String> lnCode = Rxn<String>();
  RxBool isDarkMode = false.obs;

  void executeLogin() async {
    try {
      AppLoadingWidget.show();
      final response = await _loginUseCase.execute(
        param: LoginParam(username: 'GU003T', password: '123@Gu'),
      );
      AppLoadingWidget.dismiss();
      tokenModel.value = response.netData;
      AppSnackbarWidget(
        title: R.strings.loading,
        message: 'Network Success!!!',
      ).show(Get.context);
    } on AppException catch (e) {
      AppExceptionExt(
        appException: e,
        onError: (e) {
          return AppDefaultDialogWidget()
              .setTitle('Dialog Error Home View')
              .setContent(e.message)
              .setAppDialogType(AppDialogType.error)
              .setPositiveText(R.strings.confirm)
              .setNegativeText(R.strings.close)
              .buildDialog(Get.context!)
              .show();
        },
      ).detected();
    }
  }

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
