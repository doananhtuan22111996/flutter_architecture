part of 'app_tab_base_builder.dart';

class AppTabOnlyTextWidget extends AppTabBaseBuilder {
  @override
  Widget build(BuildContext context) {
    return Tab(
      height: _appTabSize?.value,
      child: Padding(
        padding: paddingBase,
        child: textBase(context),
      ),
    );
  }

  @override
  AppTabOnlyTextWidget setLabel(String? label) {
    _label = label;
    return this;
  }

  @override
  AppTabOnlyTextWidget setAppTabSize(AppTabSize? appTabSize) {
    _appTabSize = appTabSize;
    return this;
  }

  @override
  AppTabOnlyTextWidget setIsSelected(bool isSelected) {
    _isSelected = isSelected;
    return this;
  }
}
