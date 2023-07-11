part of 'app_progress_base_builder.dart';

class AppProgressBasicWidget extends AppProgressBaseBuilder {
  @override
  AppProgressBaseBuilder setAppProgressSize(AppProgressSize? appProgressSize) {
    _appProgressSize = appProgressSize;
    return super.setAppProgressSize(appProgressSize);
  }

  @override
  AppProgressBaseBuilder setAppProgressType(AppProgressType? appProgressType) {
    _appProgressType = appProgressType;
    return super.setAppProgressType(appProgressType);
  }

  @override
  AppProgressBaseBuilder setMaxProgress(double? maxProgress) {
    _maxProgress = maxProgress;
    return super.setMaxProgress(maxProgress);
  }

  @override
  AppProgressBaseBuilder setProgress(double? progress) {
    _progress = progress;
    return super.setProgress(progress);
  }

  @override
  AppProgressBaseBuilder setIsWithNumber(bool? isWithNumber) {
    _isWithNumber = isWithNumber;
    return super.setIsWithNumber(isWithNumber);
  }

  @override
  Widget build(BuildContext context) {
    double lineHeight = AppThemeExt.of.majorScale(2);
    Widget? trailing = AppTextBody2Widget()
        .setText('${(_progress ?? 0) * 100}%')
        .setTextStyle(AppTextStyleExt.of.textBody2r)
        .build(context);
    if (_maxProgress == null) {
      setMaxProgress(AppProgressBaseBuilder.maxProgress);
    }
    if (_appProgressSize == AppProgressSize.basicSmall) {
      lineHeight = AppThemeExt.of.majorScale(6 / 4);
      trailing = AppTextBody3Widget()
          .setText('${(_progress ?? 0) * 100}%')
          .setTextStyle(AppTextStyleExt.of.textBody3r)
          .build(context);
    }
    if (_appProgressSize == AppProgressSize.basicMedium) {
      lineHeight = AppThemeExt.of.majorScale(2 / 4);
      trailing = AppTextBody3Widget()
          .setText('${(_progress ?? 0) * 100}%')
          .setTextStyle(AppTextStyleExt.of.textBody3r)
          .build(context);
    }

    return LinearPercentIndicator(
      width: _maxProgress,
      lineHeight: lineHeight,
      percent: _progress ?? 0,
      barRadius: Radius.circular(AppThemeExt.of.majorScale(25)),
      backgroundColor: AppColors.of.neutralColor[3],
      progressColor: AppColors.of.processInformColor,
      trailing: _isWithNumber == true ? trailing : null,
    );
  }
}
