part of 'app_text_field_base_builder.dart';

class AppTextFieldPasswordWidget extends AppTextFieldWidget {
  final RxBool isObscureText = true.obs;

  @override
  Widget build(BuildContext context) {
    setMaxLines(1);
    setObscureText(isObscureText.value);
    if (_appTextFieldSize == null) {
      setAppTextFieldSize(AppTextFieldSize.medium);
    }
    return Obx(
      () => _buildMain(
        suffixIcon: IconButton(
          onPressed: () {
            isObscureText.value = !isObscureText.value;
            setObscureText(isObscureText.value);
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
