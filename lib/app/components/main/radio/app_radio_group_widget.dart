import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../text/app_text_widget.dart';
import 'app_radio_widget.dart';

class RadioModel {
  final String label;
  final String value;
  bool isSelected;

  RadioModel(
      {required this.label, required this.value, this.isSelected = false});
}

class AppRadioGroupWidget extends StatelessWidget {
  final String label;
  final List<RadioModel> radios;
  final MainAxisAlignment mainAxisAlignment;
  final bool isRequired;
  final Function(RadioModel?) onChanged;

  const AppRadioGroupWidget(
      {super.key,
      required this.label,
      required this.radios,
      required this.onChanged,
      this.isRequired = false,
      this.mainAxisAlignment = MainAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextWidget(
              label,
              textStyle: context.textTheme.subtitle2
                  ?.copyWith(color: context.theme.hintColor),
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
        Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            for (int i = 0; i < radios.length; i++)
              Expanded(
                child: Row(
                  children: [
                    AppRadioWidget(
                      title: radios[i].label,
                      currentValue: radios[i].value,
                      groupValue: radios[i].isSelected ? radios[i].value : '',
                      onChanged: (value) => onChanged(radios.firstWhereOrNull(
                          (element) => element.value == value)),
                    ),
                    if (i < radios.length - 1) const Spacer(),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }
}
