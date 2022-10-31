import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'button/app_icon_button_widget.dart';
import 'text/app_text_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget(
      {required this.text,
      this.textStyle,
      this.leading,
      this.actions,
      this.goBack,
      this.goBackEnabled = true,
      this.bottomWidget = const SizedBox(),
      this.bottomHeight = 0,
      this.backgroundColor,
      Key? key})
      : super(key: key);

  final String text;
  final TextStyle? textStyle;
  final IconData? leading;
  final List<Widget>? actions;
  final bool goBackEnabled;
  final Function? goBack;
  final Widget bottomWidget;
  final double bottomHeight;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: goBackEnabled
          ? AppIconButtonWidget(
              icon: leading ?? Icons.arrow_back,
              iconColor: context.theme.colorScheme.onPrimary,
              onPressed:
                  goBack != null ? () => goBack?.call() : () => Get.back(),
            )
          : Container(),
      title: AppTextWidget(
        text,
        textStyle: textStyle ??
            context.theme.textTheme.headline6
                ?.copyWith(color: context.theme.colorScheme.onPrimary),
      ),
      centerTitle: true,
      actions: actions,
      backgroundColor: context.theme.backgroundColor,
      flexibleSpace: Container(
        color: backgroundColor,
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              context.theme.primaryColorLight,
              context.theme.primaryColor,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [Image.asset('assets/images/topbar_pattern.png')],
          ),
        ),
      ),
      bottom: bottomHeight > 0
          ? PreferredSize(
              preferredSize: Size.fromHeight(bottomHeight + 16),
              child: Column(
                children: [bottomWidget, const SizedBox(height: 16)],
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => bottomHeight > 0
      ? Size.fromHeight(kToolbarHeight + bottomHeight + 16)
      : const Size.fromHeight(kToolbarHeight);
}
