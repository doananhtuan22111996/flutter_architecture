import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_constants.dart';
import '../text/app_text_widget.dart';

class AppRadioWidget extends StatelessWidget {
  final String title;
  final String currentValue;
  final String groupValue;
  final String? description;
  final Function(String) onChanged;
  final bool bordered;

  const AppRadioWidget({
    super.key,
    required this.title,
    required this.currentValue,
    required this.groupValue,
    required this.onChanged,
    this.description,
    this.bordered = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(currentValue),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: bordered ? AppUIConstants.subHorizontalMargin : 0,
            vertical: bordered ? AppUIConstants.subVerticalMargin : 0),
        decoration: bordered
            ? BoxDecoration(
                color: context.theme.backgroundColor,
                border: Border.all(
                    color: currentValue == groupValue
                        ? context.theme.primaryColor
                        : context.theme.unselectedWidgetColor),
                borderRadius: BorderRadius.circular(4),
              )
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: AppUIConstants.radioButtonSize,
                  margin: EdgeInsets.only(
                    right: AppUIConstants.subHorizontalMargin,
                  ),
                  child: Radio<String>(
                      value: currentValue,
                      groupValue: groupValue,
                      onChanged: (value) => onChanged(value ?? ''),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
                ),
                AppTextWidget(
                  title,
                  textStyle: context.theme.textTheme.subtitle2?.copyWith(
                      color: currentValue == groupValue
                          ? context.theme.primaryColor
                          : context.theme.unselectedWidgetColor),
                ),
              ],
            ),
            if (description != null)
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: AppTextWidget(
                  description ?? '',
                  textStyle: context.theme.textTheme.subtitle1
                      ?.copyWith(color: context.theme.unselectedWidgetColor),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
