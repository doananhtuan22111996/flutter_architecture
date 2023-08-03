part of 'app_text_field_base_builder.dart';

class AppTextFieldSearchWidget extends AppTextFieldWidget {
  AppTextFieldSearchWidget({this.textNotifier});

  ValueNotifier<String?>? textNotifier;
  final ValueNotifier<String?> _errorNotifier = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    textNotifier ??= ValueNotifier<String?>(null);
    if (_appTextFieldSize == null) {
      setAppTextFieldSize(AppTextFieldSize.medium);
    }
    return _buildMain(
      prefixIcon: ValueListenableBuilder<String?>(
        valueListenable: _errorNotifier,
        builder: (context, value, child) => Padding(
          padding: _prefixPadding,
          child: R.svgs.outline.textField.search.svg(
              colorFilter: ColorFilter.mode(_prefixColor!, BlendMode.srcIn)),
        ),
      ),
      suffixIcon: _isDisabled == true || textNotifier == null
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

  Color? get _prefixColor => _isDisabled == true
      ? AppColors.of.neutralColor[5]
      : _errorNotifier.value?.isNotEmpty == true
          ? AppColors.of.errorColor
          : AppColors.of.neutralColor;

  EdgeInsets get _prefixPadding => _appTextFieldSize == AppTextFieldSize.large
      ? EdgeInsets.all(AppThemeExt.of.majorScale(4))
      : _appTextFieldSize == AppTextFieldSize.medium
          ? EdgeInsets.all(AppThemeExt.of.majorScale(3))
          : EdgeInsets.all(AppThemeExt.of.majorScale(2));
}
