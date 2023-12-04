part of 'app_text_field_base_builder.dart';

class AppTextFieldSearchWidget extends AppTextFieldBaseBuilder {
  final ValueNotifier<String?>? textNotifier = ValueNotifier<String?>(null);

  AppTextFieldSearchWidget({
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

  final ValueNotifier<String?> _errorNotifier = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    return _buildMain(
      prefixIcon: ValueListenableBuilder<String?>(
        valueListenable: _errorNotifier,
        builder: (context, value, child) => Padding(
          padding: _prefixPadding,
          child: R.svgs.outline.textField.search.svg(
              colorFilter: ColorFilter.mode(_prefixColor!, BlendMode.srcIn)),
        ),
      ),
      suffixIcon: isDisabled == true || textNotifier == null
          ? null
          : ValueListenableBuilder<String?>(
              valueListenable: textNotifier!,
              child: IconButton(
                onPressed: () => _fieldState.currentState?.didChange(null),
                icon: R.svgs.solid.textField.closeCircle.svg(),
              ),
              builder: (context, value, child) =>
                  (value?.isEmpty ?? true) ? const SizedBox() : child!,
            ),
      valueListener: (value) => textNotifier?.value = value,
      errorListener: (value) => _errorNotifier.value = value,
    );
  }

  Color? get _prefixColor => isDisabled == true
      ? AppColors.of.neutralColor[5]
      : _errorNotifier.value?.isNotEmpty == true
          ? AppColors.of.errorColor
          : AppColors.of.neutralColor;

  EdgeInsets get _prefixPadding => appTextFieldSize == AppTextFieldSize.large
      ? EdgeInsets.all(AppThemeExt.of.majorScale(4))
      : appTextFieldSize == AppTextFieldSize.medium
          ? EdgeInsets.all(AppThemeExt.of.majorScale(3))
          : EdgeInsets.all(AppThemeExt.of.majorScale(2));
}
