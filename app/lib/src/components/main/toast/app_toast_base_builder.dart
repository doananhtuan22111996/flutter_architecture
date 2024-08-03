import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/config/app_theme.dart';

import '../../../exts/R.dart';

part 'app_toast_widget.dart';

enum AppToastType {
  info(type: 'info'),
  success(type: 'success'),
  warning(type: 'warning'),
  error(type: 'error');

  final String type;

  const AppToastType({required this.type});
}

abstract class AppToastBaseBuilder {
  @protected
  final AppToastType appToastType;
  @protected
  final String? buttonText;
  @protected
  final String title;
  @protected
  final String? message;
  @protected
  final Function? onButtonPress;

  const AppToastBaseBuilder({
    required this.title,
    required this.appToastType,
    this.buttonText,
    this.message,
    this.onButtonPress,
  });

  Color backgroundColor() {
    if (appToastType == AppToastType.info) {
      return AppColors.of.processInformColor[1]!;
    } else if (appToastType == AppToastType.warning) {
      return AppColors.of.secondaryColor[1]!;
    } else if (appToastType == AppToastType.error) {
      return AppColors.of.errorColor[1]!;
    }
    return AppColors.of.successColor[1]!;
  }

  void show();

  Widget content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextBody2Widget(text: title),
        AppTextBody3Widget(
          text: message,
          textStyle: AppTextStyleExt.of.textBody3r,
        )
      ],
    );
  }

  Color borderColor() {
    if (appToastType == AppToastType.info) {
      return AppColors.of.processInformColor;
    } else if (appToastType == AppToastType.warning) {
      return AppColors.of.secondaryColor;
    } else if (appToastType == AppToastType.error) {
      return AppColors.of.errorColor;
    }
    return AppColors.of.successColor;
  }

  Widget icon() {
    if (appToastType == AppToastType.info) {
      return R.svgs.solid.toast.infoCircle.svg();
    } else if (appToastType == AppToastType.warning) {
      return R.svgs.solid.toast.exclamationCircle.svg();
    } else if (appToastType == AppToastType.error) {
      return R.svgs.solid.toast.closeCircle.svg();
    }
    return R.svgs.solid.toast.checked.svg();
  }

  Widget button() {
    return buttonText != null
        ? AppOutlinedButtonWidget(
            buttonText: buttonText,
            appButtonSize: AppButtonSize.small,
            appButtonType: appToastType == AppToastType.error
                ? AppButtonType.danger
                : AppButtonType.standard,
            onPressed: () {
              onButtonPress?.call();
              Get.closeCurrentSnackbar();
            },
          )
        : IconButton(
            icon: R.svgs.solid.toast.close.svg(),
            style: IconButton.styleFrom(
                padding: EdgeInsets.all(AppThemeExt.of.majorScale(1))),
            onPressed: () => Get.closeCurrentSnackbar(),
          );
  }
}
