part of 'app_tab_base_builder.dart';

class AppTabWithIconWidget extends AppTabBaseBuilder {
  const AppTabWithIconWidget({
    super.key,
    super.label,
    super.appTabSize,
    super.iconSelected,
    super.iconUnselected,
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
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppThemeExt.of.majorScale(1)),
              child: _icon(),
            ),
            textBase(context),
          ],
        ),
      ),
    );
  }

  @override
  AppTabWithIconWidget copyWith(
      {String? label,
      int? number,
      bool? isSelected,
      AppTabSize? appTabSize,
      Widget? iconSelected,
      Widget? iconUnselected}) {
    return AppTabWithIconWidget(
      key: super.key,
      label: label ?? super.label,
      appTabSize: appTabSize ?? super.appTabSize,
      iconSelected: iconSelected ?? super.iconSelected,
      iconUnselected: iconUnselected ?? super.iconUnselected,
      isSelected: isSelected ?? super.isSelected,
    );
  }

  Widget _icon() {
    return (isSelected == true ? iconSelected : iconUnselected) ??
        const SizedBox();
  }
}
