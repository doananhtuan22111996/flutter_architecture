part of 'app_tab_base_builder.dart';

class AppTabOnlyTextWidget extends AppTabBaseBuilder {
  const AppTabOnlyTextWidget(
      {super.key, super.label, super.appTabSize, super.isSelected});

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: appTabSize?.value,
      child: Padding(
        padding: paddingBase,
        child: textBase(context),
      ),
    );
  }

  @override
  AppTabOnlyTextWidget copyWith({
    String? label,
    int? number,
    bool? isSelected,
    AppTabSize? appTabSize,
    Widget? iconSelected,
    Widget? iconUnselected,
  }) {
    return AppTabOnlyTextWidget(
      key: super.key,
      label: label ?? super.label,
      appTabSize: appTabSize ?? super.appTabSize,
      isSelected: isSelected ?? super.isSelected,
    );
  }
}
