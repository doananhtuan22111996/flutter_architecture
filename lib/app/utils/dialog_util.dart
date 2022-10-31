import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../components/main/dialog/app_dialog_default_widget.dart';
import '../config/translations/strings_enum.dart';

class DialogUtil {
  DialogUtil._();

  static void onDialogError(
    BuildContext? context, {
    required String title,
    bool hasCloseIcon = false,
    String? subText,
    String? positiveText,
    String? negativeText,
    Function? onPositiveFunc,
    Function? onNegativeFunc,
    bool barrierDismissible = false,
  }) {
    AppDialogDefaultWidget(
      icon: SvgPicture.asset('assets/vectors/ic_error_on_dialog.svg'),
      title: title,
      subText: subText,
      hasCloseIcon: hasCloseIcon,
      positiveText: positiveText ?? Strings.close.tr,
      negativeText: negativeText,
      onPositiveFunc: onPositiveFunc,
      onNegativeFunc: onNegativeFunc,
      barrierDismissible: barrierDismissible,
    ).showDialog(Get.context);
  }

  static void onDialogSuccess(
    BuildContext? context, {
    required String title,
    String? subText,
    bool hasCloseIcon = false,
    String? positiveText,
    String? negativeText,
    Function? onPositiveFunc,
    Function? onNegativeFunc,
    bool barrierDismissible = false,
  }) {
    AppDialogDefaultWidget(
      icon: SvgPicture.asset('assets/vectors/ic_success_on_dialog.svg'),
      title: title,
      hasCloseIcon: hasCloseIcon,
      positiveText: positiveText ?? Strings.close.tr,
      negativeText: negativeText,
      onPositiveFunc: onPositiveFunc,
      onNegativeFunc: onNegativeFunc,
      barrierDismissible: barrierDismissible,
    ).showDialog(Get.context);
  }

  static void onDialogConfirm(
    BuildContext? context, {
    required String title,
    required String subText,
    bool hasCloseIcon = false,
    Function? onPositiveFunc,
    Function? onNegativeFunc,
    bool barrierDismissible = false,
  }) {
    AppDialogDefaultWidget(
      icon: SvgPicture.asset('assets/vectors/ic_waring_on_dialog.svg'),
      title: title,
      hasCloseIcon: hasCloseIcon,
      subText: subText,
      negativeText: Strings.close.tr,
      positiveText: Strings.confirm.tr,
      onPositiveFunc: onPositiveFunc,
      onNegativeFunc: onNegativeFunc,
      barrierDismissible: barrierDismissible,
    ).showDialog(Get.context);
  }
}
