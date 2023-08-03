part of 'badge_controller.dart';

class BadgePage extends GetView<BadgeController> {
  const BadgePage({super.key});

  static void open() {
    Get.toNamed(Routes.badge);
  }

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget()
        .setAppBar(AppBarWidget().setHeaderPage('Badge').build(context))
        .setBody(_body(context))
        .build(context);
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppThemeExt.of.majorScale(4)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _numberBadge(context),
              _dotBadge(context),
            ],
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: AppThemeExt.of.majorScale(2)),
            child: _stateTag(context),
          ),
        ],
      ),
    );
  }

  Widget _numberBadge(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextBody1Widget().setText('Number Badge').build(context),
        Row(
          children: [
            AppBadgeNumberWidget()
                .setNumber(13)
                .setColor(AppColors.of.primaryColor)
                .setAppBadgeBaseType(AppBadgeBaseType.filled)
                .build(context),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppThemeExt.of.majorScale(2)),
              child: AppBadgeNumberWidget()
                  .setNumber(12)
                  .setColor(AppColors.of.errorColor)
                  .setAppBadgeBaseType(AppBadgeBaseType.filled)
                  .build(context),
            ),
            AppBadgeNumberWidget()
                .setNumber(11)
                .setColor(AppColors.of.successColor)
                .setAppBadgeBaseType(AppBadgeBaseType.filled)
                .build(context),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppThemeExt.of.majorScale(2)),
              child: AppBadgeNumberWidget()
                  .setNumber(10)
                  .setColor(AppColors.of.processInformColor)
                  .setAppBadgeBaseType(AppBadgeBaseType.filled)
                  .build(context),
            ),
            AppBadgeNumberWidget()
                .setNumber(15)
                .setColor(AppColors.of.successColor)
                .setIsDisabled(true)
                .setAppBadgeBaseType(AppBadgeBaseType.filled)
                .build(context),
          ],
        ),
      ],
    );
  }

  Widget _dotBadge(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextBody1Widget().setText('Dot Badge').build(context),
        Row(
          children: [
            AppBadgeDotWidget()
                .setColor(AppColors.of.primaryColor)
                .build(context),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppThemeExt.of.majorScale(2)),
              child: AppBadgeDotWidget()
                  .setColor(AppColors.of.errorColor)
                  .build(context),
            ),
            AppBadgeDotWidget()
                .setColor(AppColors.of.successColor)
                .build(context),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppThemeExt.of.majorScale(2)),
              child: AppBadgeDotWidget()
                  .setColor(AppColors.of.processInformColor)
                  .build(context),
            ),
          ],
        ),
      ],
    );
  }

  Widget _stateTag(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextBody1Widget().setText('State Tags').build(context),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              AppStateTagWidget()
                  .setTag('Success')
                  .setAppTagBaseType(AppTagBaseType.success)
                  .build(context),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppThemeExt.of.majorScale(2)),
                child: AppStateTagWidget()
                    .setTag('Warning')
                    .setAppTagBaseType(AppTagBaseType.warning)
                    .build(context),
              ),
              AppStateTagWidget()
                  .setTag('Waiting')
                  .setAppTagBaseType(AppTagBaseType.waiting)
                  .build(context),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppThemeExt.of.majorScale(2)),
                child: AppStateTagWidget()
                    .setTag('Cancel')
                    .setAppTagBaseType(AppTagBaseType.cancel)
                    .build(context),
              ),
              AppStateTagWidget().setTag('Disabled').build(context),
            ],
          ),
        ),
      ],
    );
  }
}
