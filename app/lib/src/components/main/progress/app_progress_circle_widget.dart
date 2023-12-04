part of 'app_progress_base_builder.dart';

class AppProgressCircleWidget extends AppProgressBaseBuilder {
  const AppProgressCircleWidget({
    super.key,
    super.progress,
    super.maxProgress = AppProgressBaseBuilder.max,
    super.appProgressSize,
    super.appProgressType,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: _progressSize,
      percent: progress ?? 0,
      center: _center(context),
      progressColor: _progressColor,
      backgroundColor: AppColors.of.neutralColor[3]!,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }

  Widget _center(BuildContext context) {
    if (appProgressType == AppProgressType.error) {
      return appProgressSize == AppProgressSize.circleLarge
          ? R.svgs.outline.progress.close.svg()
          : R.svgs.outline.progress.close.svg(
              width: AppThemeExt.of.majorScale(8),
              height: AppThemeExt.of.majorScale(8),
            );
    }
    if (appProgressType == AppProgressType.success) {
      return appProgressSize == AppProgressSize.circleLarge
          ? R.svgs.outline.progress.check.svg()
          : R.svgs.outline.progress.check.svg(
              width: AppThemeExt.of.majorScale(8),
              height: AppThemeExt.of.majorScale(8),
            );
    }
    return appProgressSize == AppProgressSize.circleLarge
        ? AppTextHeading4Widget(text: '${progress ?? 0 * 100}%')
        : AppTextBody1Widget(text: '${progress ?? 0 * 100}%');
  }

  Color get _progressColor {
    if (appProgressType == AppProgressType.error) {
      return AppColors.of.errorColor;
    }
    if (appProgressType == AppProgressType.success) {
      return AppColors.of.successColor;
    }
    return AppColors.of.processInformColor;
  }

  double get _progressSize {
    if (appProgressSize == AppProgressSize.circleLarge) {
      return AppThemeExt.of.majorScale(15);
    }
    return AppThemeExt.of.majorScale(10);
  }
}
