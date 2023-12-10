part of 'app_button_base_builder.dart';

class AppTextButtonWidget extends AppButtonBaseBuilder {
  const AppTextButtonWidget({
    super.key,
    required super.buttonText,
    super.isDisabled,
    super.onPressed,
    super.textStyle,
    super.appButtonSize,
    super.appButtonType,
  });

  const AppTextButtonWidget.icon({
    super.key,
    required super.buttonText,
    required super.prefixIcon,
    super.isDisabled,
    super.onPressed,
    super.textStyle,
    super.appButtonSize,
    super.appButtonType,
  });

  @override
  Widget build(BuildContext context) {
    return _standard(context);
  }

  Widget _standard(BuildContext context) {
    return prefixIcon != null
        ? TextButton.icon(
            onPressed: isDisabled == true ? null : onPressed,
            style: _buttonStyle(context),
            icon: prefixIcon!,
            label: Text(buttonText!),
          )
        : TextButton(
            onPressed: isDisabled == true ? null : onPressed,
            style: _buttonStyle(context),
            child: Text(buttonText!),
          );
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
              return textStyleCopied?.copyWith(
                  decorationColor: AppColors.of.errorColor[6]);
            }
            if (states.contains(MaterialState.hovered)) {
              return textStyleCopied?.copyWith(
                  decorationColor: AppColors.of.errorColor[6]);
            }
            if (states.contains(MaterialState.pressed)) {
              return textStyleCopied?.copyWith(
                  decorationColor: AppColors.of.errorColor[6]);
            }
            if (states.contains(MaterialState.disabled)) {
              return textStyleCopied?.copyWith(
                  decorationColor: AppColors.of.neutralColor[5]);
            }
            return textStyleCopied?.copyWith(
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
