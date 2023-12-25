import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

@Deprecated('TODO remove')
class AppToastWidget {
  static showCustomToast(
    BuildContext? context, {
    required IconData icon,
    required String message,
    Color? backgroundColor,
  }) {
    if (context == null) return;
    Get.rawSnackbar(
      duration: const Duration(seconds: 2),
      snackStyle: SnackStyle.FLOATING,
      backgroundColor: backgroundColor ?? context.theme.primaryColor,
      onTap: (snack) => Get.closeAllSnackbars(),
      message: message,
      margin: const EdgeInsets.all(16),
      borderRadius: 4,
    );
  }

  static showErrorToast(BuildContext? context, {required String message}) {
    if (context == null) return;
    Get.rawSnackbar(
      duration: const Duration(seconds: 2),
      snackStyle: SnackStyle.FLOATING,
      backgroundGradient: LinearGradient(
        colors: [
          context.theme.errorColor,
          context.theme.errorColor,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        tileMode: TileMode.clamp,
      ),
      onTap: (snack) => Get.closeAllSnackbars(),
      message: message,
      margin: const EdgeInsets.all(16),
      borderRadius: 4,
    );
  }

  static showSuccessToast(BuildContext? context, {required String message}) {
    if (context == null) return;
    Get.rawSnackbar(
      duration: const Duration(seconds: 2),
      snackStyle: SnackStyle.FLOATING,
      backgroundGradient: LinearGradient(
        colors: [
          context.theme.primaryColorLight,
          context.theme.primaryColorLight,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        tileMode: TileMode.clamp,
      ),
      onTap: (snack) => Get.closeAllSnackbars(),
      message: message,
      margin: const EdgeInsets.all(16),
      borderRadius: 4,
    );
  }

  static showWaringToast(BuildContext? context, {required String message}) {
    if (context == null) return;
    Get.rawSnackbar(
      duration: const Duration(seconds: 2),
      snackStyle: SnackStyle.FLOATING,
      onTap: (snack) => Get.closeAllSnackbars(),
      message: message,
      margin: const EdgeInsets.all(16),
      borderRadius: 4,
    );
  }
}
