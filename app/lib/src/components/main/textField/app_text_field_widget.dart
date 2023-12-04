part of 'app_text_field_base_builder.dart';

class AppTextFieldWidget extends AppTextFieldBaseBuilder {
  AppTextFieldWidget({
    super.key,
    required super.fieldKey,
    super.hintText,
    super.isDisabled,
    super.onChanged,
    super.appTextFieldSize = AppTextFieldSize.medium,
    super.textInputAction,
    super.onFieldSubmitted,
    super.validator,
    super.obscureText,
    super.suffixIcon,
    super.maxLength,
    super.maxLines,
    super.inputFormatters,
    super.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return _buildMain(suffixIcon: suffixIcon);
  }
}
