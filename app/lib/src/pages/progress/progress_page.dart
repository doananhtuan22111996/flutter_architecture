part of 'progress_controller.dart';

class ProgressPage extends GetView<ProgressController> {
  const ProgressPage({Key? key}) : super(key: key);

  static void open() {
    Get.toNamed(Routes.progress);
  }

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
      appBar: AppBarWidget(
        headerPage: R.strings.progress,
      ).build(context),
      body: _body(context),
    );
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
        const AppTextHeading4Widget(text: 'Basic'),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        const AppProgressBasicWidget(progress: 0.3),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        const AppProgressBasicWidget(
            appProgressSize: AppProgressSize.basicMedium, progress: 0.4),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        const AppProgressBasicWidget(
            appProgressSize: AppProgressSize.basicSmall, progress: 0.5),
      ],
    );
  }

  Widget _basicWithNumber(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppTextHeading4Widget(
            text: 'Basic With Number',
            maxLines: 1,
            textOverflow: TextOverflow.ellipsis),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        const AppProgressBasicWidget(progress: 0.3, isWithNumber: true),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        const AppProgressBasicWidget(
            appProgressSize: AppProgressSize.basicMedium,
            progress: 0.4,
            isWithNumber: true),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        const AppProgressBasicWidget(
          appProgressSize: AppProgressSize.basicSmall,
          progress: 0.5,
          isWithNumber: true,
        ),
      ],
    );
  }

  Widget _lineMedium(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppTextHeading4Widget(
          text: 'Line Medium',
          maxLines: 1,
          textOverflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        const AppProgressLineWidget(
          progress: 0.3,
          appProgressSize: AppProgressSize.lineMedium,
          appProgressType: AppProgressType.processing,
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        const AppProgressLineWidget(
          progress: 0.4,
          appProgressSize: AppProgressSize.lineMedium,
          appProgressType: AppProgressType.success,
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        const AppProgressLineWidget(
          progress: 0.5,
          appProgressType: AppProgressType.error,
          appProgressSize: AppProgressSize.lineMedium,
        ),
      ],
    );
  }

  Widget _lineLarge(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppTextHeading4Widget(
            text: 'Line Large',
            maxLines: 1,
            textOverflow: TextOverflow.ellipsis),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        const AppProgressLineWidget(
            progress: 0.3,
            appProgressSize: AppProgressSize.lineLarge,
            appProgressType: AppProgressType.processing),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        const AppProgressLineWidget(
            progress: 0.4,
            appProgressSize: AppProgressSize.lineLarge,
            appProgressType: AppProgressType.success),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        const AppProgressLineWidget(
          progress: 0.5,
          appProgressSize: AppProgressSize.lineLarge,
          appProgressType: AppProgressType.error,
        ),
      ],
    );
  }

  Widget _circleMedium(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppTextHeading4Widget(
          text: 'Circle Medium',
          maxLines: 1,
          textOverflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        const AppProgressCircleWidget(
          progress: 0.3,
          appProgressType: AppProgressType.processing,
          appProgressSize: AppProgressSize.circleMedium,
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        const AppProgressCircleWidget(
          progress: 0.4,
          appProgressSize: AppProgressSize.circleMedium,
          appProgressType: AppProgressType.success,
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        const AppProgressCircleWidget(
          progress: 0.5,
          appProgressSize: AppProgressSize.circleMedium,
          appProgressType: AppProgressType.error,
        ),
      ],
    );
  }

  Widget _circleLarge(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppTextHeading4Widget(
          text: 'Circle Large',
          maxLines: 1,
          textOverflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        const AppProgressCircleWidget(
          progress: 0.3,
          appProgressSize: AppProgressSize.circleLarge,
          appProgressType: AppProgressType.processing,
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        const AppProgressCircleWidget(
          progress: 0.4,
          appProgressSize: AppProgressSize.circleLarge,
          appProgressType: AppProgressType.success,
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        const AppProgressCircleWidget(
          progress: 0.5,
          appProgressSize: AppProgressSize.circleLarge,
          appProgressType: AppProgressType.error,
        ),
      ],
    );
  }
}
