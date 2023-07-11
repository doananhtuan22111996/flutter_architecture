import 'package:app/src/components/main/appBar/app_bar_base_builder.dart';
import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/dialog/app_dialog_base_builder.dart';
import 'package:app/src/components/main/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part 'dialog_binding.dart';

part 'dialog_page.dart';

class DialogController extends GetxController {
  void dialogSuccess() {
    return AppDefaultDialogWidget()
        .setTitle('Success!')
        .setContent(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore')
        .setPositiveText(R.strings.confirm)
        .setAppDialogType(AppDialogType.success)
        .setNegativeText(R.strings.close)
        .buildDialog(Get.context!)
        .show();
  }

  void dialogError() {
    return AppDefaultDialogWidget()
        .setTitle('Error!')
        .setContent(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore')
        .setPositiveText(R.strings.confirm)
        .setAppDialogType(AppDialogType.error)
        .setNegativeText(R.strings.close)
        .buildDialog(Get.context!)
        .show();
  }

  void dialogConfirm() {
    return AppDefaultDialogWidget()
        .setTitle('Confirm!')
        .setContent(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore')
        .setPositiveText(R.strings.confirm)
        .setAppDialogType(AppDialogType.confirm)
        .setNegativeText(R.strings.close)
        .buildDialog(Get.context!)
        .show();
  }

  void dialogScreenSuccess() {
    return AppScreenDialogWidget()
        .setTitle('Success!')
        .setContent(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore')
        .setPositiveText(R.strings.confirm)
        .setAppDialogType(AppDialogType.success)
        .setNegativeText(R.strings.close)
        .buildDialog(Get.context!)
        .show();
  }

  void dialogScreenError() {
    return AppScreenDialogWidget()
        .setTitle('Error!')
        .setContent(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore')
        .setPositiveText(R.strings.confirm)
        .setAppDialogType(AppDialogType.error)
        .setNegativeText(R.strings.close)
        .buildDialog(Get.context!)
        .show();
  }

  void dialogScreenConfirm() {
    return AppScreenDialogWidget()
        .setTitle('Confirm!')
        .setContent(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore')
        .setPositiveText(R.strings.confirm)
        .setAppDialogType(AppDialogType.confirm)
        .setNegativeText(R.strings.close)
        .buildDialog(Get.context!)
        .show();
  }
}
