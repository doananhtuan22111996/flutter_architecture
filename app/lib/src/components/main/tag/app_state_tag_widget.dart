part of 'app_tag_base_builder.dart';

class AppStateTagWidget extends AppTagBaseBuilder {
  @override
  Widget build(BuildContext context) {
    if (_appTagBaseType == null) {
      setAppTagBaseType(AppTagBaseType.disabled);
    }
    return _stateTag(context);
  }

  @override
  AppTagBaseBuilder setAppTagBaseType(AppTagBaseType? appTagBaseType) {
    _appTagBaseType = appTagBaseType;
    return this;
  }

  @override
  AppTagBaseBuilder setTag(String? tag) {
    _tag = tag;
    return this;
  }

  @override
  AppTagBaseBuilder setIcon(SvgGenImage? icon) {
    _icon = icon;
    return super.setIcon(icon);
  }

  Widget _stateTag(BuildContext context) {
    Color? filledColor = Colors.transparent;
    Color? textColor = AppColors.of.neutralColor[5];
    if (_appTagBaseType == AppTagBaseType.success) {
      filledColor = AppColors.of.successColor[1];
      textColor = AppColors.of.successColor[5];
      _icon = R.svgs.outline.tagBadge.checked;
    }
    if (_appTagBaseType == AppTagBaseType.error) {
      filledColor = AppColors.of.errorColor[1];
      textColor = AppColors.of.errorColor[5];
      _icon = R.svgs.outline.tagBadge.closeCircle;
    }
    if (_appTagBaseType == AppTagBaseType.warning) {
      filledColor = AppColors.of.secondaryColor[1];
      textColor = AppColors.of.secondaryColor[6];
      _icon = R.svgs.outline.tagBadge.exclamationCircle;
    }
    if (_appTagBaseType == AppTagBaseType.processing) {
      filledColor = AppColors.of.processInformColor[1];
      textColor = AppColors.of.processInformColor[5];
      _icon = R.svgs.outline.tagBadge.infoCircle;
    }
    if (_appTagBaseType == AppTagBaseType.cancel) {
      filledColor = AppColors.of.neutralColor[2];
      textColor = AppColors.of.neutralColor[6];
      _icon = R.svgs.outline.tagBadge.closeCircle1;
    }
    if (_appTagBaseType == AppTagBaseType.waiting) {
      filledColor = AppColors.of.secondaryColor[1];
      textColor = AppColors.of.secondaryColor;
      _icon = R.svgs.outline.tagBadge.clockCircle;
    }
    if (_appTagBaseType == AppTagBaseType.value) {
      filledColor = AppColors.of.primaryColor[1];
      textColor = AppColors.of.primaryColor[5];
      _icon = R.svgs.outline.tagBadge.bulb;
    }
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppThemeExt.of.majorScale(2),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppThemeExt.of.majorScale(4)),
        border: _appTagBaseType == AppTagBaseType.disabled
            ? Border.all(color: AppColors.of.neutralColor[3]!)
            : null,
        color: filledColor,
      ),
      child: Row(
        children: [
          if (_icon != null)
            _icon!.svg(
              width: AppThemeExt.of.majorScale(4),
              height: AppThemeExt.of.majorScale(4),
            ),
          if (_icon != null) SizedBox(width: AppThemeExt.of.majorScale(1)),
          AppTextBody3Widget()
              .setText(_tag)
              .setTextStyle(
                  AppTextStyleExt.of.textBody3m?.copyWith(color: textColor))
              .build(context),
        ],
      ),
    );
  }
}
