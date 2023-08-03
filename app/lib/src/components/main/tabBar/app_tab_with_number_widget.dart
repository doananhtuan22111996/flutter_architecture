part of 'app_tab_base_builder.dart';

class AppTabWithNumberWidget extends AppTabBaseBuilder {
  @override
  Widget build(BuildContext context) {
    return Tab(
      height: _appTabSize?.value,
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

  @override
  AppTabWithNumberWidget setLabel(String? label) {
    _label = label;
    return this;
  }

  @override
  AppTabWithNumberWidget setAppTabSize(AppTabSize? appTabSize) {
    _appTabSize = appTabSize;
    return this;
  }

  @override
  AppTabWithNumberWidget setNumber(int? number) {
    _number = number;
    return this;
  }

  @override
  AppTabWithNumberWidget setIsSelected(bool isSelected) {
    _isSelected = isSelected;
    return this;
  }

  Widget _withNumber(BuildContext context) {
    return _isSelected == true
        ? AppBadgeNumberWidget()
            .setNumber(_number)
            .setAppBadgeBaseType(AppBadgeBaseType.filled)
            .setColor(AppColors.of.primaryColor)
            .build(context)
        : AppBadgeNumberWidget()
            .setNumber(_number)
            .setAppBadgeBaseType(AppBadgeBaseType.outlined)
            .build(context);
  }
}
