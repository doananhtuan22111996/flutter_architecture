import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';

part 'app_badge_number_widget.dart';

part 'app_badge_dot_widget.dart';

enum AppBadgeBaseType { filled, outlined }

abstract class AppBadgeBaseBuilder {
  @protected
  int? _number;
  @protected
  Color? _color;
  @protected
  AppBadgeBaseType? _appBadgeBaseType;
  @protected
  bool? _isDisabled;

  AppBadgeBaseBuilder setNumber(int? number) {
    return this;
  }

  AppBadgeBaseBuilder setColor(Color? color);

  AppBadgeBaseBuilder setAppBadgeBaseType(AppBadgeBaseType? appBadgeBaseType) {
    return this;
  }

  AppBadgeBaseBuilder setIsDisabled(bool? isDisabled) {
    return this;
  }

  Widget build(BuildContext context);
}
