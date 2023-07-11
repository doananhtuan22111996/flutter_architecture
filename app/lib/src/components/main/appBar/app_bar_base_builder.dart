import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part 'app_bar_widget.dart';

part 'app_bar_leading_widget.dart';

part 'app_bar_leading_avatar_widget.dart';

abstract class AppBarBaseBuilder {
  @protected
  String? _headerPage;
  @protected
  Widget? _leading;
  @protected
  bool? _centerTitle;
  @protected
  List<Widget>? _actions;
  @protected
  Color? _backgroundColor;
  @protected
  PreferredSizeWidget? _bottom;

  AppBarBaseBuilder setHeaderPage(String? headerPage);

  AppBarBaseBuilder setLeading(Widget? leading) {
    return this;
  }

  AppBarBaseBuilder setCenterTitle(bool? centerTitle) {
    return this;
  }

  AppBarBaseBuilder setActions(List<Widget>? actions) {
    return this;
  }

  AppBarBaseBuilder setBackgroundColor(Color? backgroundColor) {
    return this;
  }

  AppBarBaseBuilder setBottom(PreferredSizeWidget? bottom) {
    return this;
  }

  PreferredSizeWidget build(BuildContext context);
}
