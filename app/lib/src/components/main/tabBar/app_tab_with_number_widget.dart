part of 'app_tab_base_builder.dart';

class AppTabWithNumberWidget extends AppTabBaseBuilder {
  const AppTabWithNumberWidget({
    super.key,
    super.appTabSize,
    super.label,
    super.number,
    super.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: appTabSize?.value,
      iconMargin: EdgeInsets.zero,
      child: Padding(
        padding: paddingBase,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textBase(context),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppThemeExt.of.majorScale(1)),
              child: _withNumber(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _withNumber(BuildContext context) {
    return isSelected == true
        ? AppBadgeNumberWidget(
            number: number,
            appBadgeBaseType: AppBadgeBaseType.filled,
            color: AppColors.of.primaryColor,
          )
        : AppBadgeNumberWidget(
            number: number,
            appBadgeBaseType: AppBadgeBaseType.outlined,
          );
  }

  @override
  AppTabWithNumberWidget copyWith(
      {String? label,
      int? number,
      bool? isSelected,
      AppTabSize? appTabSize,
      Widget? iconSelected,
      Widget? iconUnselected}) {
    return AppTabWithNumberWidget(
      key: super.key,
      label: label ?? super.label,
      number: number ?? super.number,
      appTabSize: appTabSize ?? super.appTabSize,
      isSelected: isSelected ?? super.isSelected,
    );
  }
}
