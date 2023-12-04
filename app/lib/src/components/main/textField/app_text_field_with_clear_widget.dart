part of 'app_text_field_base_builder.dart';

class AppTextFieldWithClearWidget extends AppTextFieldWidget {
  final ValueNotifier<String?>? textNotifier;

  AppTextFieldWithClearWidget({
    super.key,
    required super.fieldKey,
    this.textNotifier,
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
    return _buildMain(
      suffixIcon: isDisabled == true
          ? null
          : ValueListenableBuilder<String?>(
              valueListenable: textNotifier ?? ValueNotifier<String?>(null),
              child: IconButton(
                onPressed: () => _fieldState.currentState?.didChange(null),
                icon: R.svgs.solid.textField.closeCircle.svg(),
              ),
              builder: (context, value, child) =>
                  (value?.isEmpty ?? true) ? const SizedBox() : child!,
            ),
      valueListener: (value) => textNotifier?.value = value,
    );
  }
}
