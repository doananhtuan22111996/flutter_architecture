part of 'badge_controller.dart';

class BadgePage extends GetView<BadgeController> {
  const BadgePage({super.key});

  static void open() {
    Get.toNamed(Routes.badge);
  }

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
      appBar: const AppBarWidget(headerPage: 'Badge').build(context),
      body: _body(context),
    );
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
        const AppTextBody1Widget(text: 'Number Badge'),
        Row(
          children: [
            AppBadgeNumberWidget(
              number: 13,
              color: AppColors.of.primaryColor,
              appBadgeBaseType: AppBadgeBaseType.filled,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppThemeExt.of.majorScale(2)),
              child: AppBadgeNumberWidget(
                number: 12,
                color: AppColors.of.errorColor,
                appBadgeBaseType: AppBadgeBaseType.filled,
              ),
            ),
            AppBadgeNumberWidget(
              number: 11,
              color: AppColors.of.successColor,
              appBadgeBaseType: AppBadgeBaseType.filled,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppThemeExt.of.majorScale(2)),
              child: AppBadgeNumberWidget(
                number: 10,
                color: AppColors.of.processInformColor,
                appBadgeBaseType: AppBadgeBaseType.filled,
              ),
            ),
            AppBadgeNumberWidget(
              number: 15,
              color: AppColors.of.successColor,
              isDisabled: true,
              appBadgeBaseType: AppBadgeBaseType.filled,
            ),
          ],
        ),
      ],
    );
  }

  Widget _dotBadge(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppTextBody1Widget(text: 'Dot Badge'),
        Row(
          children: [
            AppBadgeDotWidget(color: AppColors.of.primaryColor),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppThemeExt.of.majorScale(2)),
              child: AppBadgeDotWidget(color: AppColors.of.errorColor),
            ),
            AppBadgeDotWidget(color: AppColors.of.successColor),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppThemeExt.of.majorScale(2)),
              child: AppBadgeDotWidget(color: AppColors.of.processInformColor),
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
        const AppTextBody1Widget(text: 'State Tags'),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const AppStateTagWidget(
                tag: 'Success',
                appTagBaseType: AppTagBaseType.success,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppThemeExt.of.majorScale(2)),
                child: const AppStateTagWidget(
                  tag: 'Warning',
                  appTagBaseType: AppTagBaseType.warning,
                ),
              ),
              const AppStateTagWidget(
                tag: 'Waiting',
                appTagBaseType: AppTagBaseType.waiting,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppThemeExt.of.majorScale(2)),
                child: const AppStateTagWidget(
                  tag: 'Cancel',
                  appTagBaseType: AppTagBaseType.cancel,
                ),
              ),
              const AppStateTagWidget(tag: 'Disabled'),
            ],
          ),
        ),
      ],
    );
  }
}
