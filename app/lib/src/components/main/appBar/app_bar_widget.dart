part of 'app_bar_base_builder.dart';

class AppBarWidget extends AppBarBaseBuilder {
  const AppBarWidget({
    super.key,
    super.actions,
    super.backgroundColor,
    super.bottom,
    super.centerTitle,
    super.headerPage,
  });

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      title: AppTextHeading5Widget(text: headerPage),
      centerTitle: centerTitle,
      actions: actions,
      backgroundColor: backgroundColor ?? AppColors.of.neutralColor[1],
      bottom: bottom,
    );
  }
}
