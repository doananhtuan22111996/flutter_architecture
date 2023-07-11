part of 'app_button_base_builder.dart';

class AppTextButtonWidget extends AppButtonBaseBuilder {
  @override
  AppTextButtonWidget setButtonText(String? buttonText) {
    _buttonText = buttonText;
    return this;
  }

  @override
  AppTextButtonWidget setIsDisabled(bool isDisabled) {
    _isDisabled = isDisabled;
    return this;
  }

  @override
  AppTextButtonWidget setOnPressed(void Function()? onPressed) {
    _onPressed = onPressed;
    return this;
  }

  @override
  AppTextButtonWidget setPrefixIcon(Widget? prefixIcon) {
    _prefixIcon = prefixIcon;
    return this;
  }

  @override
  AppTextButtonWidget setTextStyle(TextStyle? textStyle) {
    _textStyle = textStyle;
    return this;
  }

  @override
  AppTextButtonWidget setAppButtonSize(AppButtonSize? appButtonSize) {
    _appButtonSize = appButtonSize;
    return this;
  }

  @override
  AppTextButtonWidget setAppButtonType(AppButtonType? appButtonType) {
    _appButtonType = appButtonType;
    return this;
  }

  @override
  Widget build(BuildContext context) {
    if (_prefixIcon == null && _buttonText == null) return const SizedBox();
    return _standard(context);
  }

  Widget _standard(BuildContext context) {
    return _prefixIcon != null
        ? TextButton.icon(
            onPressed: _isDisabled == true ? null : _onPressed,
            style: _buttonStyle(context),
            icon: _prefixIcon!,
            label: Text(_buttonText!),
          )
        : TextButton(
            onPressed: _isDisabled == true ? null : _onPressed,
            style: _buttonStyle(context),
            child: Text(_buttonText!),
          );
  }

  ButtonStyle? _buttonStyle(BuildContext context) {
    double horizontalPadding = AppThemeExt.of.majorScale(4);
    double verticalPadding = AppThemeExt.of.majorScale(3);
    TextStyle? textStyle = _textStyle ?? AppTextStyleExt.of.textBody1m;

    if (_appButtonSize == AppButtonSize.medium) {
      verticalPadding = AppThemeExt.of.majorScale(2);
      textStyle = _textStyle ?? AppTextStyleExt.of.textBody2m;
    }
    if (_appButtonSize == AppButtonSize.small) {
      verticalPadding = AppThemeExt.of.majorScale(1);
      textStyle = _textStyle ?? AppTextStyleExt.of.textBody2m;
    }

    if (_appButtonType == AppButtonType.danger) {
      return AppButtonStyle.textButtonDangerStyle?.copyWith(
        padding: MaterialStateProperty.resolveWith<EdgeInsets?>(
          (Set<MaterialState> states) => EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
        ),
        textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) {
              return textStyle?.copyWith(
                  decorationColor: AppColors.of.errorColor[6]);
            }
            if (states.contains(MaterialState.hovered)) {
              return textStyle?.copyWith(
                  decorationColor: AppColors.of.errorColor[6]);
            }
            if (states.contains(MaterialState.pressed)) {
              return textStyle?.copyWith(
                  decorationColor: AppColors.of.errorColor[6]);
            }
            if (states.contains(MaterialState.disabled)) {
              return textStyle?.copyWith(
                  decorationColor: AppColors.of.neutralColor[5]);
            }
            return textStyle?.copyWith(
                decorationColor: AppColors.of.errorColor);
          },
        ),
      );
    }

    return context.theme.textButtonTheme.style?.copyWith(
      padding: MaterialStateProperty.resolveWith<EdgeInsets?>(
        (Set<MaterialState> states) => EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
      ),
      textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.focused)) {
            return textStyle?.copyWith(
                decorationColor: AppColors.of.primaryColor[6]);
          }
          if (states.contains(MaterialState.hovered)) {
            return textStyle?.copyWith(
                decorationColor: AppColors.of.primaryColor[6]);
          }
          if (states.contains(MaterialState.pressed)) {
            return textStyle?.copyWith(
                decorationColor: AppColors.of.primaryColor[6]);
          }
          if (states.contains(MaterialState.disabled)) {
            return textStyle?.copyWith(
                decorationColor: AppColors.of.neutralColor[5]);
          }
          return textStyle?.copyWith(
              decorationColor: AppColors.of.primaryColor);
        },
      ),
    );
  }
}
