part of 'app_tab_base_builder.dart';

class AppTabWithIconWidget extends AppTabBaseBuilder {
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
  AppTabWithIconWidget setLabel(String? label) {
    _label = label;
    return this;
  }

  @override
  AppTabWithIconWidget setAppTabSize(AppTabSize? appTabSize) {
    _appTabSize = appTabSize;
    return this;
  }

  @override
  AppTabWithIconWidget setIconSelected(Widget? icon) {
    _iconSelected = icon;
    return this;
  }

  @override
  AppTabWithIconWidget setIconUnselected(Widget? icon) {
    _iconUnselected = icon;
    return this;
  }

  @override
  AppTabWithIconWidget setIsSelected(bool isSelected) {
    _isSelected = isSelected;
    return this;
  }

  Widget _icon() {
    return (_isSelected == true ? _iconSelected : _iconUnselected) ??
        const SizedBox();
  }
}
