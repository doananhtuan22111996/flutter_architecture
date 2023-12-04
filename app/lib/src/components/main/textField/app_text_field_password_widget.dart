part of 'app_text_field_base_builder.dart';

class AppTextFieldPasswordWidget extends AppTextFieldBaseBuilder {
  final RxBool isObscureText = true.obs;

  AppTextFieldPasswordWidget({
    super.key,
    required super.fieldKey,
    super.maxLines = 1,
    super.obscureText = true,
    super.appTextFieldSize = AppTextFieldSize.medium,
    super.hintText,
    super.isDisabled,
    super.onChanged,
    super.textInputAction,
    super.onFieldSubmitted,
    super.validator,
    super.suffixIcon,
    super.maxLength,
    super.inputFormatters,
    super.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _buildMain(
        obscureText: isObscureText.value,
        suffixIcon: IconButton(
          onPressed: () {
            isObscureText.value = !isObscureText.value;
          },
          icon: Icon(
            isObscureText.value
                ? Icons.remove_red_eye
                : Icons.remove_red_eye_outlined,
          ),
        ),
      ),
    );
  }
}
