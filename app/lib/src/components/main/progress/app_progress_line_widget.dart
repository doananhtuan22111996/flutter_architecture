part of 'app_progress_base_builder.dart';

class AppProgressLineWidget extends AppProgressBaseBuilder {
  const AppProgressLineWidget({
    super.key,
    super.maxProgress = AppProgressBaseBuilder.max,
    super.progress,
    super.appProgressSize,
    super.appProgressType,
  });

  @override
  Widget build(BuildContext context) {
    double lineHeight = AppThemeExt.of.majorScale(6 / 4);
    if (appProgressSize == AppProgressSize.lineLarge) {
      lineHeight = AppThemeExt.of.majorScale(2);
    }

    return LinearPercentIndicator(
      width: maxProgress,
      lineHeight: lineHeight,
      percent: progress ?? 0,
      barRadius: Radius.circular(AppThemeExt.of.majorScale(25)),
      backgroundColor: AppColors.of.neutralColor[3],
      progressColor: _progressColor,
      trailing: _trainingW(context),
    );
  }

  Widget _trainingW(BuildContext context) {
    Widget? trailing = appProgressSize == AppProgressSize.lineMedium
        ? R.svgs.solid.progress.clockCircle.svg()
        : R.svgs.solid.progress.clockCircle.svg(
            width: AppThemeExt.of.majorScale(4),
            height: AppThemeExt.of.majorScale(4),
          );
    if (appProgressType == AppProgressType.success) {
      trailing = appProgressSize == AppProgressSize.lineMedium
          ? R.svgs.solid.progress.checked.svg()
          : R.svgs.solid.progress.checked.svg(
              width: AppThemeExt.of.majorScale(4),
              height: AppThemeExt.of.majorScale(4),
            );
    }
    if (appProgressType == AppProgressType.error) {
      trailing = appProgressSize == AppProgressSize.lineMedium
          ? R.svgs.solid.progress.closeCircle.svg()
          : R.svgs.solid.progress.closeCircle.svg(
              width: AppThemeExt.of.majorScale(4),
              height: AppThemeExt.of.majorScale(4),
            );
    }
    return trailing;
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
}
