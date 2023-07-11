part of 'app_button_base_builder.dart';

class AppFilledButtonWidget extends AppButtonBaseBuilder {
  @override
  AppFilledButtonWidget setButtonText(String? buttonText) {
    _buttonText = buttonText;
    return this;
  }

  @override
  AppFilledButtonWidget setIsDisabled(bool isDisabled) {
    _isDisabled = isDisabled;
    return this;
  }

  @override
  AppFilledButtonWidget setOnPressed(void Function()? onPressed) {
    _onPressed = onPressed;
    return this;
  }

  @override
  AppFilledButtonWidget setPrefixIcon(Widget? prefixIcon) {
    _prefixIcon = prefixIcon;
    return this;
  }

  @override
  AppFilledButtonWidget setTextStyle(TextStyle? textStyle) {
    _textStyle = textStyle;
    return this;
  }

  @override
  AppFilledButtonWidget setAppButtonSize(AppButtonSize? appButtonSize) {
    _appButtonSize = appButtonSize;
    return this;
  }

  @override
  AppFilledButtonWidget setAppButtonType(AppButtonType? appButtonType) {
    _appButtonType = appButtonType;
    return this;
  }

  @override
  Widget build(BuildContext context) {
    if (_prefixIcon == null && _buttonText == null) return const SizedBox();
    if (_appButtonType == AppButtonType.circle) {
      return _circle(context);
    }
    if (_appButtonType == AppButtonType.square) {
      return _square(context);
    }
    return _standard(context);
  }

  Widget _standard(BuildContext context) {
    return _prefixIcon != null
        ? FilledButton.icon(
            onPressed: _isDisabled == true ? null : _onPressed,
            style: _buttonStyle(context),
            icon: _prefixIcon!,
            label: Text(_buttonText!),
          )
        : FilledButton(
            onPressed: _isDisabled == true ? null : _onPressed,
            style: _buttonStyle(context),
            child: Text(_buttonText!),
          );
  }

  Widget _circle(BuildContext context) {
    return _prefixIcon != null
        ? FilledButton(
            onPressed: _isDisabled == true ? null : _onPressed,
            style: _buttonStyle(context)?.copyWith(
              shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
                (Set<MaterialState> states) => const CircleBorder(),
              ),
            ),
            child: _prefixIcon!,
          )
        : FilledButton(
            onPressed: _isDisabled == true ? null : _onPressed,
            style: _buttonStyle(context)?.copyWith(
              shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
                (Set<MaterialState> states) => const CircleBorder(),
              ),
            ),
            child: Text(_buttonText!),
          );
  }

  Widget _square(BuildContext context) {
    double width = AppThemeExt.of.majorScale(12);
    double height = AppThemeExt.of.majorScale(12);
    double horizontalPadding = AppThemeExt.of.majorScale(3);

    if (_appButtonSize == AppButtonSize.medium) {
      width = AppThemeExt.of.majorScale(10);
      height = AppThemeExt.of.majorScale(10);
      horizontalPadding = AppThemeExt.of.majorScale(2);
    }
    if (_appButtonSize == AppButtonSize.small) {
      width = AppThemeExt.of.majorScale(8);
      height = AppThemeExt.of.majorScale(8);
      horizontalPadding = AppThemeExt.of.majorScale(1);
    }

    return SizedBox(
      width: width,
      height: height,
      child: _prefixIcon != null
          ? FilledButton(
              onPressed: _isDisabled == true ? null : _onPressed,
              style: _buttonStyle(context)?.copyWith(
                padding: MaterialStateProperty.resolveWith<EdgeInsets?>(
                  (Set<MaterialState> states) =>
                      EdgeInsets.symmetric(horizontal: horizontalPadding),
                ),
              ),
              child: _prefixIcon!,
            )
          : FilledButton(
              onPressed: _isDisabled == true ? null : _onPressed,
              style: _buttonStyle(context)?.copyWith(
                padding: MaterialStateProperty.resolveWith<EdgeInsets?>(
                  (Set<MaterialState> states) =>
                      EdgeInsets.symmetric(horizontal: horizontalPadding),
                ),
              ),
              child: Text(_buttonText!),
            ),
    );
  }

  ButtonStyle? _buttonStyle(BuildContext context) {
    double horizontalPadding = AppThemeExt.of.majorScale(4);
    double verticalPadding = AppThemeExt.of.majorScale(3);
    final textColor = AppColors.of.neutralColor[1];
    TextStyle? textStyle = _textStyle?.copyWith(color: textColor) ??
        AppTextStyleExt.of.textBody1m?.copyWith(color: textColor);

    if (_appButtonSize == AppButtonSize.medium) {
      verticalPadding = AppThemeExt.of.majorScale(2);
      textStyle = _textStyle?.copyWith(color: textStyle?.color) ??
          AppTextStyleExt.of.textBody2m?.copyWith(color: textStyle?.color);
    }
    if (_appButtonSize == AppButtonSize.small) {
      verticalPadding = AppThemeExt.of.majorScale(1);
      textStyle = _textStyle?.copyWith(color: textStyle?.color) ??
          AppTextStyleExt.of.textBody2m?.copyWith(color: textStyle?.color);
    }
    if (_appButtonType == AppButtonType.danger) {
      return AppButtonStyle.filledButtonDangerStyle?.copyWith(
        padding: MaterialStateProperty.resolveWith<EdgeInsets?>(
          (Set<MaterialState> states) => EdgeInsets.symmetric(
              horizontal: horizontalPadding, vertical: verticalPadding),
        ),
        textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
          (Set<MaterialState> states) => textStyle,
        ),
      );
    }
    return context.theme.filledButtonTheme.style?.copyWith(
      padding: MaterialStateProperty.resolveWith<EdgeInsets?>(
        (Set<MaterialState> states) => EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: verticalPadding),
      ),
      textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
        (Set<MaterialState> states) => textStyle,
      ),
    );
  }
}
