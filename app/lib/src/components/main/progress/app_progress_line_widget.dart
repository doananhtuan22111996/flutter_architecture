part of 'app_progress_base_builder.dart';

class AppProgressLineWidget extends AppProgressBaseBuilder {
  @override
  Widget build(BuildContext context) {
    double lineHeight = AppThemeExt.of.majorScale(6 / 4);
    if (_maxProgress == null) {
      setMaxProgress(AppProgressBaseBuilder.maxProgress);
    }
    if (_appProgressSize == AppProgressSize.lineLarge) {
      lineHeight = AppThemeExt.of.majorScale(2);
    }

    return LinearPercentIndicator(
      width: _maxProgress,
      lineHeight: lineHeight,
      percent: _progress ?? 0,
      barRadius: Radius.circular(AppThemeExt.of.majorScale(25)),
      backgroundColor: AppColors.of.neutralColor[3],
      progressColor: _progressColor,
      trailing: _trainingW(context),
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

  Widget _trainingW(BuildContext context) {
    Widget? trailing = _appProgressSize == AppProgressSize.lineMedium
        ? R.svgs.solid.progress.clockCircle.svg()
        : R.svgs.solid.progress.clockCircle.svg(
            width: AppThemeExt.of.majorScale(4),
            height: AppThemeExt.of.majorScale(4),
          );
    if (_appProgressType == AppProgressType.success) {
      trailing = _appProgressSize == AppProgressSize.lineMedium
          ? R.svgs.solid.progress.checked.svg()
          : R.svgs.solid.progress.checked.svg(
              width: AppThemeExt.of.majorScale(4),
              height: AppThemeExt.of.majorScale(4),
            );
    }
    if (_appProgressType == AppProgressType.error) {
      trailing = _appProgressSize == AppProgressSize.lineMedium
          ? R.svgs.solid.progress.closeCircle.svg()
          : R.svgs.solid.progress.closeCircle.svg(
              width: AppThemeExt.of.majorScale(4),
              height: AppThemeExt.of.majorScale(4),
            );
    }
    return trailing;
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
}
