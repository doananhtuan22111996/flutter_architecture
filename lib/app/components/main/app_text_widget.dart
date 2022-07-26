import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTextWidget extends StatelessWidget {
  const AppTextWidget(
      {required this.text, this.padding, this.margin, this.textStyle, Key? key})
      : super(key: key);

  final String text;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Text(
        text,
        style: textStyle ?? context.textTheme.bodyText1,
      ),
    );
  }
}
