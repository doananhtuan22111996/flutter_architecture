import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_text_widget.dart';

class AppSnackbarWidget {
  const AppSnackbarWidget(
      {required this.title,
      required this.message,
      this.icon,
      this.duration,
      this.isError = false,
      this.titleWidget,
      this.messageWidget});

  final String title;
  final String message;
  final bool isError;
  final Icon? icon;
  final Duration? duration;
  final Widget? titleWidget;
  final Widget? messageWidget;

  void show(BuildContext? context) {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
    Get.snackbar(
      title,
      message,
      titleText: titleWidget ??
          AppTextWidget(
            text: title,
            padding: EdgeInsets.zero,
            textStyle: context?.theme.textTheme.caption
                ?.copyWith(color: context.theme.primaryColor),
          ),
      duration: duration ?? const Duration(seconds: 3),
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      backgroundColor: context?.theme.dialogBackgroundColor,
      icon: isError
          ? Icon(
              Icons.error,
              color: context?.theme.errorColor,
            )
          : Icon(Icons.check_circle, color: context?.theme.primaryColor),
    );
  }
}
