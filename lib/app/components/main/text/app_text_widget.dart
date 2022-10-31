import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTextWidget extends StatelessWidget {
  const AppTextWidget(
    this.text, {
    this.textStyle,
    this.textAlign,
    this.maxLines,
    this.overflow,
    Key? key,
  }) : super(key: key);

  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: textStyle ?? context.textTheme.labelLarge,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
