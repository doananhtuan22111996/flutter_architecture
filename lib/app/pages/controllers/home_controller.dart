import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:get/get.dart';

import '../../../data/network/nets/app_exception.dart';
import '../../../data/network/nets/app_result.dart';
import '../../../domain/models/base_model.dart';
import '../../../domain/models/params/login_param.dart';
import '../../../domain/usecases/auth_use_case.dart';
import '../../components/main/app_button_widget.dart';
import '../../components/main/app_dialog_widget.dart';
import '../../components/main/app_main_widget.dart';
import '../../components/main/app_snack_bar_widget.dart';
import '../../components/main/app_text_widget.dart';
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
    Get.context?.loaderOverlay.show();
    final response = await _authUseCase
        .login(LoginParam(userName: 'jason@vinova.sg', password: '123123'));
    Get.context?.loaderOverlay.hide();
    if (response is AppResultSuccess<TokenModel>) {
      tokenModel.value = response.netData;
      const AppSnackbarWidget(
              title: Strings.loading, message: 'Network Success!!!')
          .show(Get.context);
    }
    if (response is AppResultFailure) {
      appException.value = (response as AppResultFailure).exception;
      AppDialogWidget(
              title: 'Network Error',
              negativeText: 'Close',
              positiveText: 'Ok',
              middleText: appException.value?.details ?? '')
          .showDialog(Get.context);
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
