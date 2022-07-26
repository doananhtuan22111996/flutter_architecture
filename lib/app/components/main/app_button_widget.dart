import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_text_widget.dart';

class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget(
      {required this.text,
      this.padding,
      this.margin,
      this.isEnable = true,
      this.onPressed,
      this.style,
      Key? key})
      : super(key: key);

  final String text;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool isEnable;
  final ButtonStyle? style;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButtonTheme(
      data: TextButtonThemeData(
        style: style ??
            (isEnable
                ? context.theme.textButtonTheme.style
                : context.theme.textButtonTheme.style?.copyWith(
                    backgroundColor: MaterialStateProperty.all(
                      context.theme.disabledColor,
                    ),
                  )),
      ),
      child: TextButton(
        onPressed: isEnable ? () => onPressed?.call() : null,
        child: Container(
          margin: margin ?? EdgeInsets.zero,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 12),
          child: AppTextWidget(
            text: text,
            textStyle: context.textTheme.bodyText1
                ?.copyWith(color: context.theme.primaryColor),
          ),
        ),
      ),
    );
  }
}
