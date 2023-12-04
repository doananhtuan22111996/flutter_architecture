import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

class AppTooltipWidget extends StatelessWidget {
  const AppTooltipWidget(
      {super.key, required this.child, required this.message});

  final Widget child;
  final String message;

  @override
  Widget build(BuildContext context) {
    return JustTheTooltip(
      backgroundColor: AppColors.of.neutralColor,
      triggerMode: TooltipTriggerMode.tap,
      content: Padding(
          padding: EdgeInsets.symmetric(
              vertical: AppThemeExt.of.majorScale(2),
              horizontal: AppThemeExt.of.majorScale(3)),
          child: AppTextBody1Widget(
            text: message,
            textStyle: AppTextStyleExt.of.textBody1r
                ?.copyWith(color: AppColors.of.neutralColor[1]),
          )),
      child: child,
    );
  }
}
