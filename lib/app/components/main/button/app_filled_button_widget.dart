import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/theme/app_theme.dart';
import '../text/app_text_widget.dart';

class AppFilledButtonWidget extends StatelessWidget {
  const AppFilledButtonWidget(
    this.text, {
    this.isEnable = true,
    this.onPressed,
    this.style,
    this.prefixIcon,
    this.textStyle,
    this.fillColor,
    Key? key,
  }) : super(key: key);

  final String text;
  final bool isEnable;
  final Widget? prefixIcon;
  final ButtonStyle? style;
  final TextStyle? textStyle;
  final Function? onPressed;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnable ? () => onPressed?.call() : null,
      highlightColor: context.theme.primaryColor,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          gradient: fillColor == null
              ? LinearGradient(
                  colors: [
                    isEnable
                        ? context.theme.primaryColorLight
                        : context.theme.disabledColor,
                    isEnable
                        ? context.theme.primaryColor
                        : context.theme.disabledColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  tileMode: TileMode.clamp,
                )
              : null,
          color: fillColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon != null) prefixIcon!,
            if (prefixIcon != null) const SizedBox(width: 12),
            AppTextWidget(
              text,
              textAlign: TextAlign.center,
              textStyle: textStyle ??
                  context.textTheme.subtitle2?.copyWith(
                    color: isEnable
                        ? context.theme.colorScheme.onPrimary
                        : AppColors.get().neutralColor[40],
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
