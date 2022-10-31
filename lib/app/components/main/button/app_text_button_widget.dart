import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../text/app_text_widget.dart';

class AppTextButtonWidget extends StatelessWidget {
  const AppTextButtonWidget(this.text,
      {this.isEnable = true,
      this.onPressed,
      this.style,
      this.textStyle,
      Key? key})
      : super(key: key);

  final String text;
  final bool isEnable;
  final ButtonStyle? style;
  final TextStyle? textStyle;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isEnable ? () => onPressed?.call() : null,
      style: style ?? context.theme.textButtonTheme.style,
      child: AppTextWidget(
        text,
        textAlign: TextAlign.center,
        textStyle: textStyle ??
            context.textTheme.labelLarge?.copyWith(
              color: context.theme.primaryColor,
            ),
      ),
    );
  }
}
