import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/translations/strings_enum.dart';
import '../button/app_filled_button_widget.dart';
import '../button/app_outlined_button_widget.dart';
import '../text/app_text_widget.dart';

class AppDialogScreenWidget {
  const AppDialogScreenWidget({
    required this.title,
    required this.icon,
    required this.positiveText,
    this.negativeText,
    this.subText,
    this.isError = false,
    this.onNegativeFunc,
    this.onPositiveFunc,
  });

  final Widget icon;
  final String title;
  final bool isError;
  final String? subText, negativeText;
  final String positiveText;
  final Function? onNegativeFunc, onPositiveFunc;

  void showDialog(BuildContext? context) {
    if (Get.isDialogOpen == true || context == null) {
      return;
    }
    Get.dialog(
      Container(
        color: context.theme.dialogBackgroundColor,
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(height: 32),
            AppTextWidget(
              title,
              textStyle: context.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            if (subText?.isNotEmpty == true)
              AppTextWidget(
                subText ?? Strings.serverNotResponding.tr,
                textStyle: context.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: AppFilledButtonWidget(
                positiveText,
                onPressed: onPositiveFunc != null
                    ? () => onPositiveFunc?.call()
                    : () => Get.back(),
              ),
            ),
            if (negativeText?.isNotEmpty == true) const SizedBox(height: 12),
            if (negativeText?.isNotEmpty == true)
              SizedBox(
                width: double.infinity,
                child: AppOutlinedButtonWidget(
                  negativeText ?? '',
                  onPressed: onNegativeFunc != null
                      ? () => onNegativeFunc?.call()
                      : () => Get.back(),
                ),
              ),
          ],
        ),
      ),
      useSafeArea: false,
    );
  }
}
