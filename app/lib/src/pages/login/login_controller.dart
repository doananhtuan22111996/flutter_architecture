import 'package:app/src/components/main/appBar/app_bar_base_builder.dart';
import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/pages/home/home_controller.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:utilities/utilities.dart';

import '../../components/main/loading/app_loading_overlay_indicator.dart';
import '../../components/main/toast/app_toast_base_builder.dart';
import '../../exts/R.dart';

part 'login_binding.dart';

part 'login_page.dart';

class LoginController extends GetxController {
  late final LoginUseCase _loginUseCase;

  LoginController(this._loginUseCase);

  @override
  void onInit() {
    super.onInit();
    Logs.d('on Init LoginController');
  }

  @override
  void onClose() {
    super.onClose();
    Logs.d('on Close LoginController');
  }

  void executeLogin() async {
    try {
      AppLoadingOverlayWidget.show();
      await _loginUseCase.execute(LoginParam());
      AppLoadingOverlayWidget.dismiss();
      HomePage.open();
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();
      AppToastWidget(
        title: 'Login Page',
        message: e.message,
        appToastType: AppToastType.error,
      ).show();
    }
  }
}
