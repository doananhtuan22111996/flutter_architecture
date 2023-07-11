import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/app_theme.dart';

class AppChipDropdownWidget extends StatelessWidget {
  const AppChipDropdownWidget(
      {Key? key, required this.hint, this.isSelected = false, this.onPressed})
      : super(key: key);

  final String hint;
  final bool isSelected;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed?.call(),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          buttonStyleData: ButtonStyleData(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.of.neutralColor[0],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          iconStyleData: IconStyleData(
            iconSize: 18,
            iconDisabledColor: isSelected
                ? context.theme.primaryColor
                : AppColors.of.neutralColor[80],
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              color: context.theme.colorScheme.background,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.zero,
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.zero,
          ),
          // hint: AppTextWidget(
          //   hint,
          //   textStyle: context.textTheme.titleSmall?.copyWith(
          //     color: isSelected
          //         ? context.theme.primaryColor
          //         : AppColors.of.neutralColor[80],
          //   ),
          // ),
          // disabledHint: AppTextWidget(
          //   hint,
          //   textStyle: context.textTheme.titleSmall?.copyWith(
          //     color: isSelected
          //         ? context.theme.primaryColor
          //         : AppColors.of.neutralColor[80],
          //   ),
          // ),
          alignment: AlignmentDirectional.centerStart,
          items: const [],
        ),
      ),
    );
  }
}
