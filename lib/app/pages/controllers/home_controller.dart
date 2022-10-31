import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/network/nets/app_exception.dart';
import '../../../data/network/nets/app_result.dart';
import '../../../domain/models/base_model.dart';
import '../../../domain/models/params/login_param.dart';
import '../../../domain/usecases/auth_use_case.dart';
import '../../components/main/app_bar_widget.dart';
import '../../components/main/app_icon_widget.dart';
import '../../components/main/app_main_widget.dart';
import '../../components/main/app_snack_bar_widget.dart';
import '../../components/main/button/app_filled_button_widget.dart';
import '../../components/main/dialog/app_dialog_default_widget.dart';
import '../../components/main/text/app_text_widget.dart';
import '../../config/translations/strings_enum.dart';
import '../../routes/app_pages.dart';

part '../bindings/home_binding.dart';

part '../views/home_view.dart';

class HomeController extends GetxController {
  late final AuthUseCase _authUseCase;

  HomeController(this._authUseCase);

  Rxn<TokenModel> tokenModel = Rxn<TokenModel>();
  Rxn<AppException> appException = Rxn<AppException>();

  Rxn<String> lnCode = Rxn<String>();
  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    executeGetLanguage();
    executeGetTheme();
    super.onInit();
  }

  Future<void> executeLogin() async {
    final response = await _authUseCase
        .login(LoginParam(userName: 'jason@vinova.sg', password: '123123'));
    if (response is AppResultSuccess<TokenModel>) {
      tokenModel.value = response.netData;
      const AppSnackbarWidget(
              title: Strings.loading, message: 'Network Success!!!')
          .show(Get.context);
    }
    if (response is AppResultFailure) {
      appException.value = (response as AppResultFailure).exception;
      const AppDialogDefaultWidget(
        title: 'Network Error',
        negativeText: 'Close',
        positiveText: 'Ok',
        icon: AppIconWidget(Icons.error),
      ).showDialog(Get.context);
    }
  }

  void executeGetLanguage() {
    lnCode.value = _authUseCase.languageCode();
  }

  void executeGetTheme() {
    isDarkMode.value = _authUseCase.isDarkTheme();
  }

  void executeUpdateLanguage(String code) {
    lnCode.value = code;
    _authUseCase.saveLanguageCode(code);
  }

  void executeChangeThemeMode(ThemeMode themeMode) {
    isDarkMode.value = themeMode == ThemeMode.dark;
    _authUseCase.changeThemeMode(themeMode);
  }
}
