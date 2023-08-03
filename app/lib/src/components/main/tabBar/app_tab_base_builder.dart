import 'package:app/src/components/main/badge/app_badge_base_builder.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'app_tab_only_text_widget.dart';

part 'app_tab_with_icon_widget.dart';

part 'app_tab_with_number_widget.dart';

enum AppTabSize {
  large(size: 'large', value: 48),
  medium(size: 'medium', value: 40);

  final String size;
  final double value;

  const AppTabSize({required this.size, required this.value});
}

abstract class AppTabBaseBuilder {
  @protected
  String? _label;
  @protected
  int? _number;
  @protected
  Widget? _iconSelected;
  @protected
  Widget? _iconUnselected;
  @protected
  bool? _isSelected;
  @protected
  AppTabSize? _appTabSize;

  AppTabBaseBuilder setLabel(String? label);

  AppTabBaseBuilder setNumber(int? number) {
    return this;
  }

  AppTabBaseBuilder setIconSelected(Widget? icon) {
    return this;
  }

  AppTabBaseBuilder setIconUnselected(Widget? icon) {
    return this;
  }

  AppTabBaseBuilder setIsSelected(bool isSelected) {
    return this;
  }

  AppTabBaseBuilder setAppTabSize(AppTabSize? appTabSize) {
    return this;
  }

  Widget build(BuildContext context);

  Widget textBase(BuildContext context) {
    return _appTabSize == AppTabSize.large
        ? AppTextBody1Widget()
            .setText(_label)
            .setTextStyle(textStyle(context))
            .build(context)
        : AppTextBody2Widget()
            .setText(_label)
            .setTextStyle(textStyle(context))
            .build(context);
  }

  TextStyle? textStyle(BuildContext context) => _appTabSize == AppTabSize.large
      ? _isSelected == true
          ? context.textTheme.bodyLarge?.copyWith(color: colorBase)
          : AppTextStyleExt.of.textBody1r?.copyWith(color: colorBase)
      : _isSelected == true
          ? context.textTheme.bodyMedium?.copyWith(color: colorBase)
          : AppTextStyleExt.of.textBody2r?.copyWith(color: colorBase);

  Color? get colorBase => _isSelected == true
      ? AppColors.of.primaryColor
      : AppColors.of.neutralColor;

  EdgeInsetsGeometry get paddingBase => _appTabSize == AppTabSize.large
      ? EdgeInsets.symmetric(
          horizontal: AppThemeExt.of.majorScale(2),
          vertical: AppThemeExt.of.majorScale(3),
        )
      : EdgeInsets.symmetric(
          horizontal: AppThemeExt.of.majorScale(3),
          vertical: AppThemeExt.of.majorScale(2),
        );
}
