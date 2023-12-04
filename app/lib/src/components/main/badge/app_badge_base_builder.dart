import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'app_badge_number_widget.dart';

part 'app_badge_dot_widget.dart';

enum AppBadgeBaseType { filled, outlined }

abstract class AppBadgeBaseBuilder extends StatelessWidget {
  @protected
  final int? number;
  @protected
  final Color? color;
  @protected
  final AppBadgeBaseType? appBadgeBaseType;
  @protected
  final bool? isDisabled;

  const AppBadgeBaseBuilder({
    super.key,
    required this.color,
    this.number,
    this.appBadgeBaseType = AppBadgeBaseType.filled,
    this.isDisabled,
  });
}
