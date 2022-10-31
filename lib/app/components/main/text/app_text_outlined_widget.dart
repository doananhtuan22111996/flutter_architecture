import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_text_widget.dart';

class AppTextOutlinedWidget extends StatelessWidget {
  const AppTextOutlinedWidget(this.text,
      {Key? key, this.borderColor, this.textStyle})
      : super(key: key);

  final String text;
  final Color? borderColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
            width: 1, color: borderColor ?? context.theme.primaryColor),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: AppTextWidget(
        text,
        textStyle: textStyle ?? context.theme.textTheme.labelLarge,
      ),
    );
  }
}
