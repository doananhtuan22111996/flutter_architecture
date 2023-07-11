part of 'app_bar_base_builder.dart';

class AppBarLeadingAvatarWidget extends AppBarBaseBuilder {
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      leading: _leading ??
          AppButtonAppBarWidget()
              .setPrefixIcon(R.svgs.icArrowLineLeft.svg())
              .setOnPressed(() => Get.back())
              .build(context),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppButtonAppBarWidget()
              .setPrefixIcon(R.svgs.icAvatar.svg())
              .setOnPressed(() {})
              .build(context),
          Flexible(
              child:
                  AppTextHeading5Widget().setText(_headerPage).build(context)),
        ],
      ),
      centerTitle: _centerTitle,
      actions: _actions ?? [AppButtonAppBarWidget().build(context)],
      backgroundColor: _backgroundColor ?? AppColors.of.neutralColor[1],
      bottom: _bottom,
    );
  }

  @override
  AppBarBaseBuilder setActions(List<Widget>? actions) {
    _actions = actions;
    return this;
  }

  @override
  AppBarBaseBuilder setBackgroundColor(Color? backgroundColor) {
    _backgroundColor = backgroundColor;
    return this;
  }

  @override
  AppBarBaseBuilder setCenterTitle(bool? centerTitle) {
    _centerTitle = centerTitle ?? true;
    return this;
  }

  @override
  AppBarBaseBuilder setHeaderPage(String? headerPage) {
    _headerPage = headerPage;
    return this;
  }

  @override
  AppBarBaseBuilder setLeading(Widget? leading) {
    _leading = leading;
    return this;
  }
}
