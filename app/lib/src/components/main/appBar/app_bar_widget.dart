part of 'app_bar_base_builder.dart';

class AppBarWidget extends AppBarBaseBuilder {
  const AppBarWidget({
    super.key,
    super.actions,
    super.backgroundColor,
    super.bottom,
    super.headerPage,
  }) : _centerTitle = false;

  const AppBarWidget.centerTitle({
    super.key,
    super.actions,
    super.backgroundColor,
    super.bottom,
    super.headerPage,
  }) : _centerTitle = true;

  final bool _centerTitle;

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      title: AppTextHeading5Widget(text: headerPage),
      centerTitle: _centerTitle,
      actions: actions,
      backgroundColor: backgroundColor ?? AppColors.of.neutralColor[1],
      bottom: bottom,
    );
  }
}
