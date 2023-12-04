import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// TODO build dropdown follow builder pattern
class DropdownModel {
  final String value;
  final String name;
  bool isSelected;

  DropdownModel({
    required this.value,
    required this.name,
    this.isSelected = false,
  });
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
        buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          height: 32,
          decoration: BoxDecoration(
            color: context.theme.colorScheme.background,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        iconStyleData: IconStyleData(
          iconSize: 18,
          iconEnabledColor:
              isSelected ? context.theme.primaryColor : context.theme.hintColor,
          iconDisabledColor: context.theme.disabledColor,
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            color: context.theme.colorScheme.background,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.zero,
        ),
        // hint: AppTextWidget(
        //   hint,
        //   textStyle: context.textTheme.bodyMedium
        //       ?.copyWith(color: context.theme.colorScheme.outline),
        // ),
        // disabledHint: AppTextWidget(
        //   hint,
        //   textStyle: context.textTheme.bodyMedium?.copyWith(
        //     color: context.theme.disabledColor,
        //   ),
        // ),
        value: items.firstWhereOrNull((element) => element.isSelected)?.value,
        alignment: AlignmentDirectional.centerStart,
        menuItemStyleData: const MenuItemStyleData(padding: EdgeInsets.zero),
        items: items
            .map(
              (e) => DropdownMenuItem(
                value: e.value,
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  height: kMinInteractiveDimension,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  color: context.theme.colorScheme.background,
                  // child: AppTextWidget(
                  //   e.name,
                  //   textStyle: context.textTheme.labelLarge,
                  // ),
                ),
              ),
            )
            .toList(),
        // selectedItemBuilder: (context) => items
        //     .map(
        //       (e) => AppTextWidget(
        //         e.name,
        //         textStyle: context.textTheme.titleSmall
        //             ?.copyWith(color: context.theme.primaryColor),
        //       ),
        //     )
        //     .toList(),
        onChanged: (value) => onChange
            ?.call(items.firstWhereOrNull((element) => element.value == value)),
      ),
    );
  }
}
