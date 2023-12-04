import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';

part 'app_main_page_widget.dart';

abstract class AppMainPageBaseBuilder extends StatelessWidget {
  @protected
  final Widget? body;
  @protected
  final PreferredSizeWidget? appBar;
  @protected
  final Widget? endDrawer;
  @protected
  final Color? backgroundColor;
  @protected
  final void Function(bool)? onEndDrawerChanged;

  const AppMainPageBaseBuilder({
    super.key,
    this.body,
    this.appBar,
    this.endDrawer,
    this.backgroundColor,
    this.onEndDrawerChanged,
  });
}
