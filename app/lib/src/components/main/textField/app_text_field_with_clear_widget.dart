part of 'app_text_field_base_builder.dart';

class AppTextFieldWithClearWidget extends AppTextFieldWidget {
  AppTextFieldWithClearWidget({this.textNotifier});

  ValueNotifier<String?>? textNotifier;

  @override
  Widget build(BuildContext context) {
    textNotifier ??= ValueNotifier<String?>(null);
    if (_appTextFieldSize == null) {
      setAppTextFieldSize(AppTextFieldSize.medium);
    }
    return _buildMain(
      suffixIcon: _isDisabled == true
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
    );
  }
}
