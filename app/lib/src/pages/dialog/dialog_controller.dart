import 'package:app/src/components/main/appBar/app_bar_base_builder.dart';
import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/dialog/app_dialog_base_builder.dart';
import 'package:app/src/components/main/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../exts/R.dart';

part 'dialog_binding.dart';

part 'dialog_page.dart';

class DialogController extends GetxController {
  void dialogSuccess() {
    return AppDefaultDialogWidget(
      title: 'Success!',
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
      positiveText: R.strings.confirm,
      appDialogType: AppDialogType.success,
      negativeText: R.strings.close,
    ).show();
  }

  void dialogError() {
    return AppDefaultDialogWidget(
      title: 'Error!',
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
      positiveText: R.strings.confirm,
      appDialogType: AppDialogType.error,
      negativeText: R.strings.close,
    ).show();
  }

  void dialogConfirm() {
    return AppDefaultDialogWidget(
      title: 'Confirm!',
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
      positiveText: R.strings.confirm,
      appDialogType: AppDialogType.confirm,
      negativeText: R.strings.close,
    ).show();
  }

  void dialogScreenSuccess() {
    return AppScreenDialogWidget(
      title: 'Success!',
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
      positiveText: R.strings.confirm,
      appDialogType: AppDialogType.success,
      negativeText: R.strings.close,
    ).show();
  }

  void dialogScreenError() {
    return AppScreenDialogWidget(
      title: 'Error!',
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
      positiveText: R.strings.confirm,
      appDialogType: AppDialogType.error,
      negativeText: R.strings.close,
    ).show();
  }

  void dialogScreenConfirm() {
    return AppScreenDialogWidget(
      title: 'Confirm!',
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
      positiveText: R.strings.confirm,
      appDialogType: AppDialogType.confirm,
      negativeText: R.strings.close,
    ).show();
  }
}
