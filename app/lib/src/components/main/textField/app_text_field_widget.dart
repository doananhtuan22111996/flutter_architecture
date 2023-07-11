part of 'app_text_field_base_builder.dart';

class AppTextFieldWidget extends AppTextFieldBaseBuilder {
  @override
  AppTextFieldBaseBuilder setFieldKey(String? fieldKey) {
    _fieldKey = _fieldKey;
    return this;
  }

  @override
  AppTextFieldBaseBuilder setHintText(String? hintText) {
    _hintText = hintText;
    return this;
  }

  @override
  AppTextFieldBaseBuilder setIsDisabled(bool? isDisabled) {
    _isDisabled = isDisabled;
    return this;
  }

  @override
  AppTextFieldBaseBuilder setValue(String? value) {
    _value = value;
    return this;
  }

  @override
  AppTextFieldBaseBuilder setOnChanged(
      void Function(String? value)? onChanged) {
    _onChanged = onChanged;
    return super.setOnChanged(onChanged);
  }

  @override
  AppTextFieldBaseBuilder setAppTextFieldSize(
      AppTextFieldSize? appTextFieldSize) {
    _appTextFieldSize = appTextFieldSize;
    return super.setAppTextFieldSize(appTextFieldSize);
  }

  @override
  Widget build(BuildContext context) {
    if (_appTextFieldSize == null) {
      setAppTextFieldSize(AppTextFieldSize.medium);
    }
    return FormBuilderField<String?>(
      name: _fieldKey,
      builder: (field) => TextFormField(
        keyboardType: _keyboardType,
        inputFormatters: _inputFormatters,
        onChanged: (value) => _onChanged?.call(value),
        textAlign: TextAlign.start,
        maxLines: _maxLines,
        maxLength: _maxLength,
        minLines: 1,
        readOnly: _isDisabled == false,
        style: _textStyle,
        obscureText: _obscureText ?? false,
        validator: _validator,
        // textInputAction: widget.textInputAction,
        // onFieldSubmitted: (v) {
        //   if (widget.onActionTap != null) {
        //     widget.onActionTap!(v);
        //   }
        // },
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.of.neutralColor[5]!),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.of.neutralColor[3]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.of.primaryColor),
          ),
          hintText: _hintText,
          hintStyle: _textStyle?.copyWith(color: AppColors.of.neutralColor[6]),
          contentPadding: _contentPadding,
          isDense: true,
        ),
      ),
    );
  }

  TextStyle? get _textStyle => _appTextFieldSize == AppTextFieldSize.large
      ? AppTextStyleExt.of.textBody2r
      : _appTextFieldSize == AppTextFieldSize.small
          ? AppTextStyleExt.of.textBody2r
          : AppTextStyleExt.of.textBody1r;

  EdgeInsets get _contentPadding => _appTextFieldSize == AppTextFieldSize.large
      ? EdgeInsets.symmetric(
          vertical: AppThemeExt.of.majorScale(3),
          horizontal: AppThemeExt.of.majorScale(4))
      : _appTextFieldSize == AppTextFieldSize.small
          ? EdgeInsets.symmetric(
              vertical: AppThemeExt.of.majorScale(1),
              horizontal: AppThemeExt.of.majorScale(3))
          : EdgeInsets.symmetric(
              vertical: AppThemeExt.of.majorScale(2),
              horizontal: AppThemeExt.of.majorScale(4));
}
