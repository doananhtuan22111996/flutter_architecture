part of 'progress_controller.dart';

class ProgressPage extends GetView<ProgressController> {
  const ProgressPage({Key? key}) : super(key: key);

  static void open() {
    Get.toNamed(Routes.progress);
  }

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget()
        .setAppBar(
            AppBarWidget().setHeaderPage(R.strings.progress).build(context))
        .setBody(_body(context))
        .build(context);
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(AppThemeExt.of.majorScale(4)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(child: _basic(context)),
                Expanded(child: _basicWithNumber(context)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _lineMedium(context),
                _lineLarge(context),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _circleLarge(context),
                _circleMedium(context),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _basic(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextHeading4Widget().setText('Basic').build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppProgressBasicWidget().setProgress(0.3).build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppProgressBasicWidget()
            .setAppProgressSize(AppProgressSize.basicMedium)
            .setProgress(0.4)
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppProgressBasicWidget()
            .setAppProgressSize(AppProgressSize.basicSmall)
            .setProgress(0.5)
            .build(context),
      ],
    );
  }

  Widget _basicWithNumber(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextHeading4Widget()
            .setText('Basic With Number')
            .setMaxLines(1)
            .setTextOverFlow(TextOverflow.ellipsis)
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppProgressBasicWidget()
            .setProgress(0.3)
            .setIsWithNumber(true)
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppProgressBasicWidget()
            .setAppProgressSize(AppProgressSize.basicMedium)
            .setProgress(0.4)
            .setIsWithNumber(true)
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppProgressBasicWidget()
            .setAppProgressSize(AppProgressSize.basicSmall)
            .setProgress(0.5)
            .setIsWithNumber(true)
            .build(context),
      ],
    );
  }

  Widget _lineMedium(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextHeading4Widget()
            .setText('Line Medium')
            .setMaxLines(1)
            .setTextOverFlow(TextOverflow.ellipsis)
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppProgressLineWidget()
            .setProgress(0.3)
            .setAppProgressSize(AppProgressSize.lineMedium)
            .setAppProgressType(AppProgressType.processing)
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppProgressLineWidget()
            .setProgress(0.4)
            .setAppProgressSize(AppProgressSize.lineMedium)
            .setAppProgressType(AppProgressType.success)
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppProgressLineWidget()
            .setProgress(0.5)
            .setAppProgressSize(AppProgressSize.lineMedium)
            .setAppProgressType(AppProgressType.error)
            .build(context),
      ],
    );
  }

  Widget _lineLarge(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextHeading4Widget()
            .setText('Line Large')
            .setMaxLines(1)
            .setTextOverFlow(TextOverflow.ellipsis)
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppProgressLineWidget()
            .setProgress(0.3)
            .setAppProgressSize(AppProgressSize.lineLarge)
            .setAppProgressType(AppProgressType.processing)
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppProgressLineWidget()
            .setProgress(0.4)
            .setAppProgressSize(AppProgressSize.lineLarge)
            .setAppProgressType(AppProgressType.success)
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppProgressLineWidget()
            .setProgress(0.5)
            .setAppProgressSize(AppProgressSize.lineLarge)
            .setAppProgressType(AppProgressType.error)
            .build(context),
      ],
    );
  }

  Widget _circleMedium(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextHeading4Widget()
            .setText('Circle Medium')
            .setMaxLines(1)
            .setTextOverFlow(TextOverflow.ellipsis)
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppProgressCircleWidget()
            .setProgress(0.3)
            .setAppProgressSize(AppProgressSize.circleMedium)
            .setAppProgressType(AppProgressType.processing)
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppProgressCircleWidget()
            .setProgress(0.4)
            .setAppProgressSize(AppProgressSize.circleMedium)
            .setAppProgressType(AppProgressType.success)
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppProgressCircleWidget()
            .setProgress(0.5)
            .setAppProgressSize(AppProgressSize.circleMedium)
            .setAppProgressType(AppProgressType.error)
            .build(context),
      ],
    );
  }

  Widget _circleLarge(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextHeading4Widget()
            .setText('Circle Large')
            .setMaxLines(1)
            .setTextOverFlow(TextOverflow.ellipsis)
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppProgressCircleWidget()
            .setProgress(0.3)
            .setAppProgressSize(AppProgressSize.circleLarge)
            .setAppProgressType(AppProgressType.processing)
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppProgressCircleWidget()
            .setProgress(0.4)
            .setAppProgressSize(AppProgressSize.circleLarge)
            .setAppProgressType(AppProgressType.success)
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppProgressCircleWidget()
            .setProgress(0.5)
            .setAppProgressSize(AppProgressSize.circleLarge)
            .setAppProgressType(AppProgressType.error)
            .build(context),
      ],
    );
  }
}
