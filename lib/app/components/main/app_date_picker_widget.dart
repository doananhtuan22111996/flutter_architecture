import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../config/theme/app_theme.dart';
import '../../config/translations/strings_enum.dart';
import '../../constants/app_constants.dart';
import 'app_icon_widget.dart';
import 'text/app_text_widget.dart';

class AppDatePickerWidget extends StatelessWidget {
  const AppDatePickerWidget(
    this.label, {
    Key? key,
    this.onChanged,
    this.isDisabled = false,
    this.validator,
    this.initValue,
    this.isRequired = false,
  }) : super(key: key);

  final String label;
  final DateTime? initValue;
  final Function(DateTime)? onChanged;
  final String? validator;
  final bool isDisabled;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppTextWidget(
              label,
              textStyle: context.textTheme.caption?.copyWith(
                color: AppColors.get().neutralColor[60],
              ),
            ),
            if (isRequired) const SizedBox(width: 2),
            if (isRequired)
              AppTextWidget(
                '*',
                textStyle: context.textTheme.caption
                    ?.copyWith(color: context.theme.errorColor),
              )
          ],
        ),
        InkWell(
          onTap: () async {
            FocusScope.of(context).requestFocus(FocusNode());
            await DatePicker.showDatePicker(context,
                showTitleActions: true,
                onConfirm: (date) => onChanged?.call(date),
                currentTime: initValue,
                locale: Get.locale?.languageCode == 'vi'
                    ? LocaleType.vi
                    : LocaleType.en,
                minTime: DateTime(1930, 1, 1));
          },
          child: InputDecorator(
            decoration: InputDecoration(
                errorText: validator,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.get().neutralColor[20]!),
                ),
                disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.get().neutralColor[20]!),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: context.theme.primaryColor),
                ),
                contentPadding: const EdgeInsets.only(top: 10, bottom: 12),
                isDense: true,
                suffixIcon: const AppIconWidget(Icons.calendar_today),
                suffixIconConstraints: BoxConstraints(
                    minWidth: AppUIConstants.svgSize,
                    minHeight: AppUIConstants.svgSize)),
            child: AppTextWidget(
              initValue != null
                  ? DateFormat(AppConstants.dateTimeDefaultFormat)
                      .format(initValue ?? DateTime.now())
                  : Strings.dateDefaultFormat.tr,
              textStyle: initValue != null
                  ? context.textTheme.subtitle2
                  : context.textTheme.bodyText2
                      ?.copyWith(color: context.theme.disabledColor),
            ),
          ),
        ),
      ],
    );
  }
}
