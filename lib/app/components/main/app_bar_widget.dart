import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_text_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget(
      {required this.text,
      this.textStyle,
      this.leading,
      this.actions,
      this.goBack,
      this.isGoBack = true,
      Key? key})
      : super(key: key);

  final String text;
  final TextStyle? textStyle;
  final Widget? leading;
  final List<Widget>? actions;
  final bool isGoBack;
  final Function? goBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isGoBack
          ? InkWell(
              onTap: goBack != null ? goBack?.call() : () => Get.back(),
              child: leading ??
                  Icon(Icons.chevron_left_outlined,
                      color: context.theme.iconTheme.color),
            )
          : null,
      title: AppTextWidget(
        text: text,
        textStyle: textStyle ?? context.theme.textTheme.headline2,
      ),
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
