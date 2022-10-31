import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/theme/app_theme.dart';
import '../text/app_text_widget.dart';

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
          buttonPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          buttonHeight: 32,
          iconSize: 18,
          buttonDecoration: BoxDecoration(
            color: AppColors.get().neutralColor[0],
            borderRadius: BorderRadius.circular(8),
          ),
          dropdownDecoration: BoxDecoration(
            color: context.theme.backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          hint: AppTextWidget(
            hint,
            textStyle: context.textTheme.subtitle2?.copyWith(
                color: isSelected
                    ? context.theme.primaryColor
                    : AppColors.get().neutralColor[80]),
          ),
          disabledHint: AppTextWidget(
            hint,
            textStyle: context.textTheme.subtitle2?.copyWith(
              color: isSelected
                  ? context.theme.primaryColor
                  : AppColors.get().neutralColor[80],
            ),
          ),
          alignment: AlignmentDirectional.centerStart,
          iconDisabledColor: isSelected
              ? context.theme.primaryColor
              : AppColors.get().neutralColor[80],
          dropdownPadding: EdgeInsets.zero,
          itemPadding: EdgeInsets.zero,
          items: const [],
        ),
      ),
    );
  }
}
