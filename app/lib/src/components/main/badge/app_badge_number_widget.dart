part of 'app_badge_base_builder.dart';

class AppBadgeNumberWidget extends AppBadgeBaseBuilder {
  const AppBadgeNumberWidget({
    super.key,
    super.color,
    super.number,
    super.isDisabled,
    super.appBadgeBaseType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppThemeExt.of.majorScale(5),
      height: AppThemeExt.of.majorScale(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isDisabled == true ? Colors.transparent : color,
        border: _border,
      ),
      alignment: Alignment.center,
      child: AppTextBody3Widget(
        text: number?.toString() ?? 0.toString(),
        textStyle: context.textTheme.bodySmall?.copyWith(color: _textColor),
      ),
    );
  }

  Border? get _border => isDisabled == true
      ? Border.all(color: AppColors.of.neutralColor[3]!)
      : appBadgeBaseType == AppBadgeBaseType.outlined
          ? Border.all(color: AppColors.of.neutralColor[4]!)
          : null;

  Color? get _textColor => isDisabled == true
      ? AppColors.of.neutralColor[5]
      : appBadgeBaseType == AppBadgeBaseType.outlined
          ? AppColors.of.neutralColor
          : AppColors.of.neutralColor[1];
}
