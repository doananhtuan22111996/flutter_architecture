part of 'app_badge_base_builder.dart';

class AppBadgeNumberWidget extends AppBadgeBaseBuilder {
  @override
  Widget build(BuildContext context) {
    if (_appBadgeBaseType == null) {
      setAppBadgeBaseType(AppBadgeBaseType.filled);
    }
    return Container(
      width: AppThemeExt.of.majorScale(5),
      height: AppThemeExt.of.majorScale(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _isDisabled == true ? Colors.transparent : _color,
        border: _border,
      ),
      alignment: Alignment.center,
      child: AppTextBody3Widget()
          .setText(_number?.toString() ?? 0.toString())
          .setColor(_textColor)
          .build(context),
    );
  }

  Border? get _border => _isDisabled == true
      ? Border.all(color: AppColors.of.neutralColor[3]!)
      : _appBadgeBaseType == AppBadgeBaseType.outlined
          ? Border.all(color: AppColors.of.neutralColor[4]!)
          : null;

  Color? get _textColor => _isDisabled == true
      ? AppColors.of.neutralColor[5]
      : _appBadgeBaseType == AppBadgeBaseType.outlined
          ? AppColors.of.neutralColor
          : AppColors.of.neutralColor[1];

  @override
  AppBadgeBaseBuilder setColor(Color? color) {
    _color = color;
    return this;
  }

  @override
  AppBadgeBaseBuilder setNumber(int? number) {
    _number = number;
    return this;
  }

  @override
  AppBadgeBaseBuilder setAppBadgeBaseType(AppBadgeBaseType? appBadgeBaseType) {
    _appBadgeBaseType = appBadgeBaseType;
    return super.setAppBadgeBaseType(appBadgeBaseType);
  }

  @override
  AppBadgeBaseBuilder setIsDisabled(bool? isDisabled) {
    _isDisabled = isDisabled;
    return super.setIsDisabled(isDisabled);
  }
}
