part of 'app_bar_base_builder.dart';

class AppBarLeadingAvatarWidget extends AppBarBaseBuilder {
  const AppBarLeadingAvatarWidget({
    super.key,
    super.actions,
    super.backgroundColor,
    super.centerTitle,
    super.headerPage,
    super.leading,
  });

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      leading: leading ??
          AppButtonAppBarWidget(
            prefixIcon: R.svgs.outline.appBar.arrowLineLeft.svg(),
            onPressed: () => Get.back(),
          ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppAvatarSvgWidget(
              svg: R.svgs.avatar.account.svg(), size: AppAvatarSize.medium),
          Flexible(child: AppTextHeading5Widget(text: headerPage)),
        ],
      ),
      centerTitle: centerTitle,
      actions: actions ?? [const AppButtonAppBarWidget()],
      backgroundColor: backgroundColor ?? AppColors.of.neutralColor[1],
      bottom: bottom,
    );
  }
}
