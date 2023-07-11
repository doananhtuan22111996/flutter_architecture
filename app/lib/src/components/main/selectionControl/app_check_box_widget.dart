part of 'app_selection_control_base_builder.dart';

class AppCheckBoxWidget extends AppSelectionControlBaseBuilder {
  @override
  Widget build(BuildContext context) {
    return FormBuilderField<bool?>(
      name: _fieldKey,
      initialValue: _value,
      builder: (field) => Row(
        children: [
          Checkbox(
            value: field.value ?? false,
            activeColor: _activeColor,
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) => AppColors.of.neutralColor[3],
            ),
            side: BorderSide(color: _sideColor),
            onChanged: _isDisabled == true
                ? null
                : (value) {
                    field.didChange(value);
                    _onValueChanged?.call(value);
                  },
          ),
          if (_label != null)
            AppTextBody2Widget()
                .setText(_label)
                .setTextStyle(
                    AppTextStyleExt.of.textBody2r?.copyWith(color: _labelColor))
                .build(context)
        ],
      ),
    );
  }

  Color? get _activeColor => _isDisabled == true
      ? AppColors.of.neutralColor[4]
      : AppColors.of.primaryColor;

  Color get _sideColor => _isDisabled == true
      ? AppColors.of.neutralColor[3]!
      : AppColors.of.neutralColor[5]!;
  Color? get _labelColor => _isDisabled == true
      ? AppColors.of.neutralColor[5]
      : AppColors.of.neutralColor;

  @override
  AppSelectionControlBaseBuilder setLabel(String? label) {
    _label = label;
    return super.setLabel(label);
  }

  @override
  AppSelectionControlBaseBuilder setFieldKey(String fieldKey) {
    _fieldKey = fieldKey;
    return super.setFieldKey(fieldKey);
  }

  @override
  AppSelectionControlBaseBuilder setValue(bool? value) {
    _value = value;
    return super.setValue(value);
  }

  @override
  AppSelectionControlBaseBuilder setIsDisabled(bool? isDisabled) {
    _isDisabled = isDisabled;
    return super.setIsDisabled(isDisabled);
  }

  @override
  AppSelectionControlBaseBuilder setOnValueChanged(
      void Function(dynamic value)? onValueChanged) {
    _onValueChanged = onValueChanged;
    return super.setOnValueChanged(onValueChanged);
  }
}
