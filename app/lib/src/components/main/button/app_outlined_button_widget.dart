part of 'app_button_base_builder.dart';

class AppOutlinedButtonWidget extends AppButtonBaseBuilder {
  const AppOutlinedButtonWidget({
    super.key,
    required super.buttonText,
    super.isDisabled,
    super.onPressed,
    super.textStyle,
    super.appButtonSize,
    super.appButtonType,
  });

  const AppOutlinedButtonWidget.icon({
    super.key,
    required super.prefixIcon,
    super.buttonText,
    super.isDisabled,
    super.onPressed,
    super.textStyle,
    super.appButtonSize,
    super.appButtonType,
  });

  @override
  Widget build(BuildContext context) {
    if (appButtonType == AppButtonType.circle) {
      return _circle(context);
    }
    if (appButtonType == AppButtonType.square) {
      return _square(context);
    }
    return _standard(context);
  }

  Widget _standard(BuildContext context) {
    return prefixIcon != null
        ? OutlinedButton.icon(
            onPressed: isDisabled == true ? null : onPressed,
            style: _buttonStyle(context),
            icon: prefixIcon!,
            label: Text(buttonText!),
          )
        : OutlinedButton(
            onPressed: isDisabled == true ? null : onPressed,
            style: _buttonStyle(context),
            child: Text(buttonText!),
          );
  }

  Widget _circle(BuildContext context) {
    return prefixIcon != null
        ? OutlinedButton(
            onPressed: isDisabled == true ? null : onPressed,
            style: _buttonStyle(context)?.copyWith(
              shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
                (Set<MaterialState> states) => const CircleBorder(),
              ),
            ),
            child: prefixIcon!,
          )
        : OutlinedButton(
            onPressed: isDisabled == true ? null : onPressed,
            style: _buttonStyle(context)?.copyWith(
              shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
                (Set<MaterialState> states) => const CircleBorder(),
              ),
            ),
            child: Text(buttonText!),
          );
  }

  Widget _square(BuildContext context) {
    double width = AppThemeExt.of.majorScale(12);
    double height = AppThemeExt.of.majorScale(12);
    double horizontalPadding = AppThemeExt.of.majorScale(3);
    if (appButtonSize == AppButtonSize.medium) {
      width = AppThemeExt.of.majorScale(10);
      height = AppThemeExt.of.majorScale(10);
      horizontalPadding = AppThemeExt.of.majorScale(2);
    }
    if (appButtonSize == AppButtonSize.small) {
      width = AppThemeExt.of.majorScale(8);
      height = AppThemeExt.of.majorScale(8);
      horizontalPadding = AppThemeExt.of.majorScale(1);
    }

    return SizedBox(
        width: width,
        height: height,
        child: prefixIcon != null
            ? OutlinedButton(
                onPressed: isDisabled == true ? null : onPressed,
                style: _buttonStyle(context)?.copyWith(
                  padding: MaterialStateProperty.resolveWith<EdgeInsets?>(
                    (Set<MaterialState> states) => EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                    ),
                  ),
                ),
                child: prefixIcon!,
              )
            : OutlinedButton(
                onPressed: isDisabled == true ? null : onPressed,
                style: _buttonStyle(context)?.copyWith(
                  padding: MaterialStateProperty.resolveWith<EdgeInsets?>(
                    (Set<MaterialState> states) => EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                    ),
                  ),
                ),
                child: Text(buttonText!),
              ));
  }

  ButtonStyle? _buttonStyle(BuildContext context) {
    double horizontalPadding = AppThemeExt.of.majorScale(4);
    double verticalPadding = AppThemeExt.of.majorScale(3);
    TextStyle? textStyleCopied = textStyle ?? AppTextStyleExt.of.textBody1m;

    if (appButtonSize == AppButtonSize.medium) {
      verticalPadding = AppThemeExt.of.majorScale(2);
      textStyleCopied = textStyle ?? AppTextStyleExt.of.textBody2m;
    }
    if (appButtonSize == AppButtonSize.small) {
      verticalPadding = AppThemeExt.of.majorScale(1);
      textStyleCopied = textStyle ?? AppTextStyleExt.of.textBody2m;
    }
    if (appButtonType == AppButtonType.danger) {
      return AppButtonStyle.outlinedButtonDangerStyle?.copyWith(
        padding: MaterialStateProperty.resolveWith<EdgeInsets?>(
          (Set<MaterialState> states) => EdgeInsets.symmetric(
              horizontal: horizontalPadding, vertical: verticalPadding),
        ),
        textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
          (Set<MaterialState> states) => textStyleCopied,
        ),
      );
    }
    return context.theme.outlinedButtonTheme.style?.copyWith(
      padding: MaterialStateProperty.resolveWith<EdgeInsets?>(
        (Set<MaterialState> states) => EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: verticalPadding),
      ),
      textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
        (Set<MaterialState> states) => textStyleCopied,
      ),
    );
  }
}
