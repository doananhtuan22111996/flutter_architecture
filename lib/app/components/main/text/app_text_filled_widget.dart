import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_text_widget.dart';

class AppTextFilledWidget extends StatelessWidget {
  const AppTextFilledWidget(this.text, {Key? key, this.color, this.textStyle})
      : super(key: key);

  final String text;
  final Color? color;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          color: color ?? context.theme.colorScheme.surfaceVariant),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: AppTextWidget(
        text,
        textStyle: textStyle ?? context.theme.textTheme.caption,
      ),
    );
  }
}
