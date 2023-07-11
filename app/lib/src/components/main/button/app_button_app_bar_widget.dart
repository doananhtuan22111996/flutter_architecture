part of 'app_button_base_builder.dart';

class AppButtonAppBarWidget extends AppButtonBaseBuilder {
  @override
  AppButtonBaseBuilder setOnPressed(void Function()? onPressed) {
    _onPressed = onPressed;
    return this;
  }

  @override
  AppButtonBaseBuilder setPrefixIcon(Widget? prefixIcon) {
    _prefixIcon = prefixIcon;
    return this;
  }

  @override
  Widget build(BuildContext context) {
    if (_prefixIcon == null) {
      return SizedBox(
        width: AppThemeExt.of.majorScale(12),
        height: AppThemeExt.of.majorScale(12),
      );
    }
    return _standard(context);
  }

  Widget _standard(BuildContext context) {
    return IconButton(
      icon: _prefixIcon!,
      iconSize: AppThemeExt.of.majorScale(6),
      padding: EdgeInsets.zero,
      onPressed: _onPressed,
    );
  }
}
