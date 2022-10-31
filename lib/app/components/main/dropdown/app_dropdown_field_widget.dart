import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/theme/app_theme.dart';
import '../../../config/translations/strings_enum.dart';
import '../text/app_text_widget.dart';
import 'app_dropdown_widget.dart';
import 'lib/searchable_dropdown.dart';

class AppDropdownFieldWidget extends StatelessWidget {
  AppDropdownFieldWidget({
    Key? key,
    required this.hint,
    required this.items,
    required this.label,
    this.isEnabled = true,
    this.onChanged,
    this.validator,
    this.value,
    this.isRequired = false,
  }) : super(key: key);

  final String label;
  final String hint;
  final bool isEnabled;
  final String? validator;
  final String? value;
  final bool isRequired;
  final List<DropdownModel> items;
  final Function(DropdownModel? value)? onChanged;

  final isFocused = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
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
          SearchableDropdown<String>(
            errorText: validator,
            isEnabled: isEnabled,
            isFocused: isFocused.value,
            value: value,
            noRecordText: AppTextWidget(
              Strings.emptyMessage.tr,
              textStyle: context.textTheme.bodyText2,
            ),
            hintText: AppTextWidget(
              hint,
              textStyle: context.textTheme.bodyText2
                  ?.copyWith(color: context.theme.hintColor),
            ),
            items: items
                .map(
                  (e) => SearchableDropdownMenuItem<String>(
                    value: e.value,
                    label: e.name,
                    child: AppTextWidget(
                      e.name,
                      textStyle: context.textTheme.bodyText2,
                    ),
                  ),
                )
                .toList(),
            onChanged: isEnabled
                ? (String? value) {
                    if (isEnabled) {
                      onChanged?.call(items.firstWhereOrNull(
                          (element) => element.value == value));
                    }
                  }
                : null,
            onFocusUnFocus: ((value) {
              if (!value) {
                FocusScope.of(context).requestFocus(FocusNode());
              }
              isFocused.value = value;
            }),
          )
        ],
      ),
    );
  }
}
