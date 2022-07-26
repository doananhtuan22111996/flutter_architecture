import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_button_widget.dart';
import 'app_text_widget.dart';

class AppDialogWidget {
  const AppDialogWidget({
    required this.title,
    required this.negativeText,
    required this.positiveText,
    this.middleText = 'Dialog made in 3 lines of code',
    this.contentPadding,
    this.isError = false,
    this.negativeTextColor,
    this.positiveTextColor,
    this.backgroundColor,
    this.middleStyle,
    this.titleStyle,
    this.negativeStyle,
    this.positiveStyle,
    this.onNegativeFunc,
    this.onPositiveFunc,
  });

  final String title;
  final bool isError;
  final String middleText;
  final Color? negativeTextColor, positiveTextColor, backgroundColor;
  final TextStyle? titleStyle, middleStyle;
  final EdgeInsets? contentPadding;
  final ButtonStyle? negativeStyle, positiveStyle;
  final String negativeText, positiveText;
  final Function? onNegativeFunc, onPositiveFunc;

  void showDialog(BuildContext? context) {
    if (Get.isDialogOpen == true) {
      return;
    }
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        insetPadding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor ?? context?.theme.backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: contentPadding ?? const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isError ? Icons.error : Icons.check_circle,
                color: isError
                    ? context?.theme.errorColor
                    : context?.theme.iconTheme.color,
              ),
              AppTextWidget(
                text: title,
                textStyle: titleStyle,
              ),
              const SizedBox(height: 16),
              AppTextWidget(
                text: middleText,
                textStyle: middleStyle,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppButtonWidget(
                    text: negativeText,
                    style: negativeStyle,
                    onPressed: onNegativeFunc != null
                        ? () {
                            onNegativeFunc?.call();
                            Get.back();
                          }
                        : () => Get.back(),
                  ),
                  AppButtonWidget(
                    text: positiveText,
                    style: positiveStyle,
                    onPressed: onPositiveFunc != null
                        ? () {
                            onPositiveFunc?.call();
                            Get.back();
                          }
                        : () => Get.back(),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
