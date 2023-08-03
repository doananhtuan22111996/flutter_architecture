import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:resources/resources.dart';

part 'app_state_tag_widget.dart';

enum AppTagBaseType {
  success,
  error,
  warning,
  processing,
  cancel,
  waiting,
  value,
  disabled,
  actionTagWidgetIcon,
  actionTagDisabled,
  actionTagOnlyText,
}

abstract class AppTagBaseBuilder {
  @protected
  String? _tag;
  @protected
  SvgGenImage? _icon;
  @protected
  AppTagBaseType? _appTagBaseType;

  AppTagBaseBuilder setTag(String? tag);

  AppTagBaseBuilder setIcon(SvgGenImage? icon) {
    return this;
  }

  AppTagBaseBuilder setAppTagBaseType(AppTagBaseType? appTagBaseType);

  Widget build(BuildContext context);
}
