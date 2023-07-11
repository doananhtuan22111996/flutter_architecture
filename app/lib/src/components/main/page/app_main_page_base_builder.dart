import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';

part 'app_main_page_widget.dart';

abstract class AppMainPageBaseBuilder {
  @protected
  Key? _key;
  @protected
  Widget? _body;
  @protected
  PreferredSizeWidget? _appBar;
  @protected
  Widget? _endDrawer;
  @protected
  Color? _backgroundColor;
  @protected
  void Function(bool)? _onEndDrawerChanged;

  AppMainPageBaseBuilder setKey(Key? key);

  AppMainPageBaseBuilder setAppBar(PreferredSizeWidget? appBar);

  AppMainPageBaseBuilder setBody(Widget? body);

  AppMainPageBaseBuilder setEndDrawer(Widget? endDrawer);

  AppMainPageBaseBuilder setBackgroundColor(Color? backgroundColor);

  AppMainPageBaseBuilder setEndDrawerChanged(
      void Function(bool)? onEndDrawerChanged);

  Widget build(BuildContext context);
}
