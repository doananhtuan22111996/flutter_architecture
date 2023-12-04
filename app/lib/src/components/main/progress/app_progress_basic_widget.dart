part of 'app_progress_base_builder.dart';

class AppProgressBasicWidget extends AppProgressBaseBuilder {
  const AppProgressBasicWidget({
    super.key,
    super.appProgressSize,
    super.appProgressType,
    super.maxProgress = AppProgressBaseBuilder.max,
    super.progress,
    super.isWithNumber,
  });

  @override
  Widget build(BuildContext context) {
    double lineHeight = AppThemeExt.of.majorScale(2);
    Widget? trailing = AppTextBody2Widget(
      text: '${(progress ?? 0) * 100}%',
      textStyle: AppTextStyleExt.of.textBody2r,
    );
    if (appProgressSize == AppProgressSize.basicSmall) {
      lineHeight = AppThemeExt.of.majorScale(6 / 4);
      trailing = AppTextBody3Widget(
        text: '${(progress ?? 0) * 100}%',
        textStyle: AppTextStyleExt.of.textBody3r,
      );
    }
    if (appProgressSize == AppProgressSize.basicMedium) {
      lineHeight = AppThemeExt.of.majorScale(2 / 4);
      trailing = AppTextBody3Widget(
        text: '${(progress ?? 0) * 100}%',
        textStyle: AppTextStyleExt.of.textBody3r,
      );
    }

    return LinearPercentIndicator(
      width: maxProgress,
      lineHeight: lineHeight,
      percent: progress ?? 0,
      barRadius: Radius.circular(AppThemeExt.of.majorScale(25)),
      backgroundColor: AppColors.of.neutralColor[3],
      progressColor: AppColors.of.processInformColor,
      trailing: isWithNumber == true ? trailing : null,
    );
  }
}
