part of 'app_progress_base_builder.dart';

class AppProgressCircleWidget extends AppProgressBaseBuilder {
  @override
  Widget build(BuildContext context) {
    if (_maxProgress == null) {
      setMaxProgress(AppProgressBaseBuilder.maxProgress);
    }
    return CircularPercentIndicator(
      radius: _progressSize,
      percent: _progress ?? 0,
      center: _center(context),
      progressColor: _progressColor,
      backgroundColor: AppColors.of.neutralColor[3]!,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }

  @override
  AppProgressBaseBuilder setProgress(double? progress) {
    _progress = progress;
    return super.setProgress(progress);
  }

  @override
  AppProgressBaseBuilder setMaxProgress(double? maxProgress) {
    _maxProgress = maxProgress;
    return super.setMaxProgress(maxProgress);
  }

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

  Widget _center(BuildContext context) {
    if (_appProgressType == AppProgressType.error) {
      return _appProgressSize == AppProgressSize.circleLarge
          ? R.svgs.icCloseError32.svg()
          : R.svgs.icCloseError24.svg();
    }
    if (_appProgressType == AppProgressType.success) {
      return _appProgressSize == AppProgressSize.circleLarge
          ? R.svgs.icCheckSuccess32.svg()
          : R.svgs.icCheckSuccess24.svg();
    }
    return _appProgressSize == AppProgressSize.circleLarge
        ? AppTextHeading4Widget()
            .setText('${_progress ?? 0 * 100}%')
            .build(context)
        : AppTextBody1Widget()
            .setText('${_progress ?? 0 * 100}%')
            .build(context);
  }

  Color get _progressColor {
    if (_appProgressType == AppProgressType.error) {
      return AppColors.of.errorColor;
    }
    if (_appProgressType == AppProgressType.success) {
      return AppColors.of.successColor;
    }
    return AppColors.of.processInformColor;
  }

  double get _progressSize {
    if (_appProgressSize == AppProgressSize.circleLarge) {
      return AppThemeExt.of.majorScale(15);
    }
    return AppThemeExt.of.majorScale(10);
  }
}
