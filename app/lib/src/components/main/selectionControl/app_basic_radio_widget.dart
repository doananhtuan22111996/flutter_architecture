part of 'app_selection_control_base_builder.dart';

class AppBasicRadioWidget<T> extends AppSelectionControlBaseBuilder<T> {
  const AppBasicRadioWidget({
    super.key,
    required super.fieldKey,
    required super.value,
    required super.label,
    super.radioGroupValue,
    super.onValueChanged,
    super.isDisabled,
  });

  const AppBasicRadioWidget.noLabel({
    super.key,
    required super.fieldKey,
    required super.value,
    super.radioGroupValue,
    super.onValueChanged,
    super.isDisabled,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<T>(
      name: fieldKey,
      initialValue: radioGroupValue,
      builder: (field) => Row(
        children: [
          Radio<T>(
            value: value,
            groupValue: field.value,
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) => AppColors.of.neutralColor[3],
            ),
            fillColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return AppColors.of.primaryColor;
                }
                if (states.contains(MaterialState.disabled)) {
                  return AppColors.of.neutralColor[3];
                }
                return AppColors.of.neutralColor[5];
              },
            ),
            onChanged: isDisabled == true
                ? null
                : (value) {
                    field.didChange(value);
                    onValueChanged?.call(value);
                  },
          ),
          if (label != null)
            AppTextBody2Widget(
              text: label,
              textStyle:
                  AppTextStyleExt.of.textBody2r?.copyWith(color: _labelColor),
            )
        ],
      ),
    );
  }

  Color? get _labelColor => isDisabled == true
      ? AppColors.of.neutralColor[5]
      : AppColors.of.neutralColor;
}
