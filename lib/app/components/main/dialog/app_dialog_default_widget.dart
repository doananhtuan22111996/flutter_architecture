import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../config/translations/strings_enum.dart';
import '../button/app_filled_button_widget.dart';
import '../button/app_outlined_button_widget.dart';
import '../text/app_text_widget.dart';

class AppDialogDefaultWidget {
  const AppDialogDefaultWidget({
    required this.title,
    required this.icon,
    required this.positiveText,
    this.hasCloseIcon = true,
    this.negativeText,
    this.subText,
    this.onNegativeFunc,
    this.onPositiveFunc,
    this.barrierDismissible = false,
    this.positiveButtonColor,
  });

  final Widget icon;
  final bool? hasCloseIcon;
  final bool? barrierDismissible;
  final String title;
  final String? subText, negativeText;
  final String positiveText;
  final Color? positiveButtonColor;
  final Function? onNegativeFunc, onPositiveFunc;

  void showDialog(BuildContext? context) {
    if (Get.isDialogOpen == true || context == null) {
      return;
    }
    Get.dialog(
      Dialog(
        insetPadding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            color: context.theme.dialogBackgroundColor,
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.all(16).copyWith(top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              hasCloseIcon == true
                  ? Container(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () => Get.back(),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'assets/vectors/ic_close.svg',
                            color: Colors.grey[900],
                          ),
                        ),
                      ),
                    )
                  : Container(),
              icon,
              const SizedBox(height: 24),
              AppTextWidget(
                title,
                textStyle: context.textTheme.headline6,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              if (subText?.isNotEmpty == true)
                AppTextWidget(
                  subText ?? Strings.serverNotResponding.tr,
                  textStyle: context.textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (negativeText?.isNotEmpty == true)
                    Expanded(
                      child: AppOutlinedButtonWidget(
                        negativeText ?? '',
                        onPressed: onNegativeFunc != null
                            ? () => onNegativeFunc?.call()
                            : () => Get.back(),
                      ),
                    ),
                  if (negativeText?.isNotEmpty == true)
                    const SizedBox(width: 8),
                  Expanded(
                    child: AppFilledButtonWidget(
                      positiveText,
                      fillColor: positiveButtonColor,
                      onPressed: onPositiveFunc != null
                          ? () => onPositiveFunc?.call()
                          : () => Get.back(),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      barrierDismissible: barrierDismissible ?? false,
    );
  }
}
