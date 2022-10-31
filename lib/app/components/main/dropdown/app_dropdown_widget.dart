import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../text/app_text_widget.dart';

class DropdownModel {
  final String value;
  final String name;
  bool isSelected;

  DropdownModel(
      {required this.value, required this.name, this.isSelected = false});
}

class AppDropdownWidget extends StatelessWidget {
  const AppDropdownWidget({
    Key? key,
    required this.hint,
    required this.items,
    this.onChange,
  }) : super(key: key);
  final String hint;
  final List<DropdownModel> items;
  final Function(DropdownModel? value)? onChange;

  @override
  Widget build(BuildContext context) {
    final isSelected =
        items.firstWhereOrNull((element) => element.isSelected)?.value != null;
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        buttonPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        buttonHeight: 32,
        iconSize: 18,
        buttonDecoration: BoxDecoration(
          color: context.theme.backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        dropdownDecoration: BoxDecoration(
          color: context.theme.backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        hint: AppTextWidget(
          hint,
          textStyle: context.textTheme.bodyText2
              ?.copyWith(color: context.theme.colorScheme.outline),
        ),
        disabledHint: AppTextWidget(
          hint,
          textStyle: context.textTheme.bodyText2?.copyWith(
            color: context.theme.disabledColor,
          ),
        ),
        value: items.firstWhereOrNull((element) => element.isSelected)?.value,
        alignment: AlignmentDirectional.centerStart,
        iconEnabledColor:
            isSelected ? context.theme.primaryColor : context.theme.hintColor,
        iconDisabledColor: context.theme.disabledColor,
        dropdownPadding: EdgeInsets.zero,
        itemPadding: EdgeInsets.zero,
        items: items
            .map(
              (e) => DropdownMenuItem(
                value: e.value,
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  height: kMinInteractiveDimension,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  color: context.theme.backgroundColor,
                  child: AppTextWidget(
                    e.name,
                    textStyle: context.textTheme.labelLarge,
                  ),
                ),
              ),
            )
            .toList(),
        selectedItemBuilder: (context) => items
            .map(
              (e) => AppTextWidget(
                e.name,
                textStyle: context.textTheme.subtitle2
                    ?.copyWith(color: context.theme.primaryColor),
              ),
            )
            .toList(),
        onChanged: (value) => onChange
            ?.call(items.firstWhereOrNull((element) => element.value == value)),
      ),
    );
  }
}
