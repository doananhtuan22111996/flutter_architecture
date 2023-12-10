import 'package:app/src/components/main/avatar/app_avatar_base_builder.dart';
import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part 'app_bar_widget.dart';

part 'app_bar_leading_widget.dart';

part 'app_bar_leading_avatar_widget.dart';

abstract class AppBarBaseBuilder extends StatelessWidget {
  @protected
  final String? headerPage;
  @protected
  final Widget? leading;
  @protected
  final List<Widget>? actions;
  @protected
  final Color? backgroundColor;
  @protected
  final PreferredSizeWidget? bottom;

  const AppBarBaseBuilder({
    super.key,
    this.headerPage,
    this.leading,
    this.actions,
    this.backgroundColor,
    this.bottom,
  });

  @override
  PreferredSizeWidget build(BuildContext context);
}
