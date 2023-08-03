part of 'app_text_field_base_builder.dart';

class AppTextFieldWidget extends AppTextFieldBaseBuilder {
  @override
  AppTextFieldBaseBuilder setFieldKey(String fieldKey) {
    _fieldKey = fieldKey;
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
  AppTextFieldBaseBuilder setTextInputAction(TextInputAction? textInputAction) {
    _textInputAction = textInputAction;
    return super.setTextInputAction(textInputAction);
  }

  @override
  AppTextFieldBaseBuilder setOnFieldSubmitted(
      String? Function(String? value)? onFieldSubmitted) {
    _onFieldSubmitted = onFieldSubmitted;
    return super.setOnFieldSubmitted(onFieldSubmitted);
  }

  @override
  AppTextFieldBaseBuilder setValidator(
      String? Function(String? value)? validator) {
    _validator = validator;
    return super.setValidator(validator);
  }

  @override
  AppTextFieldBaseBuilder setObscureText(bool? obscureText) {
    _obscureText = obscureText;
    return super.setObscureText(obscureText);
  }

  @override
  AppTextFieldBaseBuilder setSuffixIcon(Widget? suffixIcon) {
    _suffixIcon = suffixIcon;
    return super.setSuffixIcon(suffixIcon);
  }

  @override
  AppTextFieldBaseBuilder setMaxLines(int? maxLines) {
    _maxLines = maxLines;
    return super.setMaxLines(maxLines);
  }

  @override
  AppTextFieldBaseBuilder setMaxLength(int? maxLength) {
    _maxLength = maxLength;
    return super.setMaxLength(maxLength);
  }

  @override
  AppTextFieldBaseBuilder setInputFormatters(
      List<TextInputFormatter>? inputFormatters) {
    _inputFormatters = inputFormatters;
    return super.setInputFormatters(inputFormatters);
  }

  @override
  AppTextFieldBaseBuilder setKeyboardType(TextInputType? keyboardType) {
    _keyboardType = keyboardType;
    return super.setKeyboardType(keyboardType);
  }

  @override
  Widget build(BuildContext context) {
    if (_appTextFieldSize == null) {
      setAppTextFieldSize(AppTextFieldSize.medium);
    }
    return _buildMain(suffixIcon: _suffixIcon);
  }
}
