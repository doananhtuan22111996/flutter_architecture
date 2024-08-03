import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../exts/R.dart';

part 'app_dialog_default_widget.dart';

part 'app_dialog_screen_widget.dart';

enum AppDialogType {
  success(type: 'success'),
  error(type: 'error'),
  confirm(type: 'confirm');

  final String type;

  const AppDialogType({required this.type});
}

abstract class AppDialogBaseBuilder extends Dialog {
  @protected
  final String? title;
  @protected
  final String? content;
  @protected
  final String? positiveText;
  @protected
  final String? negativeText;
  @protected
  final AppDialogType? appDialogType;
  @protected
  final void Function()? onPositive;
  @protected
  final void Function()? onNegative;

  const AppDialogBaseBuilder({
    super.key,
    this.title,
    this.content,
    this.positiveText,
    this.negativeText,
    this.appDialogType,
    this.onPositive,
    this.onNegative,
  });


  void show() {
    if (Get.isDialogOpen == true) return;
    Get.dialog(this, barrierDismissible: false, useSafeArea: false);
  }
}
