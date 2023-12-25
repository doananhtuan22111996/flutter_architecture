import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

@Deprecated('TODO remove')
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
    // Get.snackbar(title, message,
    //     titleText: titleWidget ??
    //         AppTextWidget(
    //           title,
    //           textStyle: context?.theme.textTheme.caption
    //               ?.copyWith(color: AppColors.of.neutralColor[0]),
    //         ),
    //     messageText: messageWidget ??
    //         AppTextWidget(
    //           message,
    //           textStyle: context?.theme.textTheme.bodyText1
    //               ?.copyWith(color: AppColors.of.neutralColor[0]),
    //         ),
    //     duration: duration ?? const Duration(seconds: 3),
    //     margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    //     backgroundColor:
    //         isError ? context?.theme.errorColor : context?.theme.primaryColor,
    //     icon: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: isError
    //           ? Icon(
    //               Icons.error,
    //               color: AppColors.of.neutralColor[0],
    //               size: 32,
    //             )
    //           : Icon(
    //               Icons.check_circle,
    //               color: AppColors.of.neutralColor[0],
    //               size: 32,
    //             ),
    //     ),
    //     snackPosition: SnackPosition.BOTTOM);
  }
}
