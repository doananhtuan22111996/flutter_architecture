part of 'app_tag_base_builder.dart';

class AppStateTagWidget extends AppTagBaseBuilder {
  const AppStateTagWidget({super.key, super.appTagBaseType, super.tag});

  @override
  Widget build(BuildContext context) {
    return _stateTag(context);
  }

  Widget _stateTag(BuildContext context) {
    Color? filledColor = Colors.transparent;
    Color? textColor = AppColors.of.neutralColor[5];
    SvgGenImage? icon;
    if (appTagBaseType == AppTagBaseType.success) {
      filledColor = AppColors.of.successColor[1];
      textColor = AppColors.of.successColor[5];
      icon = R.svgs.outline.tagBadge.checked;
    }
    if (appTagBaseType == AppTagBaseType.error) {
      filledColor = AppColors.of.errorColor[1];
      textColor = AppColors.of.errorColor[5];
      icon = R.svgs.outline.tagBadge.closeCircle;
    }
    if (appTagBaseType == AppTagBaseType.warning) {
      filledColor = AppColors.of.secondaryColor[1];
      textColor = AppColors.of.secondaryColor[6];
      icon = R.svgs.outline.tagBadge.exclamationCircle;
    }
    if (appTagBaseType == AppTagBaseType.processing) {
      filledColor = AppColors.of.processInformColor[1];
      textColor = AppColors.of.processInformColor[5];
      icon = R.svgs.outline.tagBadge.infoCircle;
    }
    if (appTagBaseType == AppTagBaseType.cancel) {
      filledColor = AppColors.of.neutralColor[2];
      textColor = AppColors.of.neutralColor[6];
      icon = R.svgs.outline.tagBadge.closeCircle1;
    }
    if (appTagBaseType == AppTagBaseType.waiting) {
      filledColor = AppColors.of.secondaryColor[1];
      textColor = AppColors.of.secondaryColor;
      icon = R.svgs.outline.tagBadge.clockCircle;
    }
    if (appTagBaseType == AppTagBaseType.value) {
      filledColor = AppColors.of.primaryColor[1];
      textColor = AppColors.of.primaryColor[5];
      icon = R.svgs.outline.tagBadge.bulb;
    }
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppThemeExt.of.majorScale(2),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppThemeExt.of.majorScale(4)),
        border: appTagBaseType == AppTagBaseType.disabled
            ? Border.all(color: AppColors.of.neutralColor[3]!)
            : null,
        color: filledColor,
      ),
      child: Row(
        children: [
          if (icon != null)
            icon.svg(
              width: AppThemeExt.of.majorScale(4),
              height: AppThemeExt.of.majorScale(4),
            ),
          if (icon != null) SizedBox(width: AppThemeExt.of.majorScale(1)),
          AppTextBody3Widget(
            text: tag,
            textStyle:
                AppTextStyleExt.of.textBody3m?.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}
