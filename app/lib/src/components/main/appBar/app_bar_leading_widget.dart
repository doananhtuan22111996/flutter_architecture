part of 'app_bar_base_builder.dart';

class AppBarLeadingWidget extends AppBarBaseBuilder {
  const AppBarLeadingWidget({
    super.key,
    super.actions,
    super.backgroundColor,
    super.bottom,
    super.centerTitle,
    super.headerPage,
    super.leading,
  });

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      leading: leading ??
          AppButtonAppBarWidget(
            prefixIcon: R.svgs.outline.appBar.arrowLineLeft.svg(),
            onPressed: () => Get.back(),
          ),
      title: AppTextHeading5Widget(text: headerPage),
      centerTitle: centerTitle,
      actions: actions,
      backgroundColor: backgroundColor ?? AppColors.of.neutralColor[1],
      bottom: bottom,
    );
  }
}
