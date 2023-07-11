part of 'app_selection_control_base_builder.dart';

class AppBasicRadioWidget extends AppSelectionControlBaseBuilder {
  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: _fieldKey,
      initialValue: _radioGroupValue,
      builder: (field) => Row(
        children: [
          Radio<dynamic>(
            value: _value,
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
  AppSelectionControlBaseBuilder setValue(dynamic value) {
    _value = value;
    return super.setValue(value);
  }

  @override
  AppSelectionControlBaseBuilder setRadioGroupValue(dynamic radioGroupValue) {
    _radioGroupValue = radioGroupValue;
    return super.setRadioGroupValue(radioGroupValue);
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
