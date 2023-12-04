import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'app_filled_button_widget.dart';

part 'app_outlined_button_widget.dart';

part 'app_text_button_widget.dart';

part 'app_button_app_bar_widget.dart';

enum AppButtonSize {
  large(size: 'large'),
  medium(size: 'medium'),
  small(size: 'small');

  final String size;

  const AppButtonSize({required this.size});
}

enum AppButtonType {
  standard(type: 'standard'),
  danger(type: 'danger'),
  circle(type: 'circle'),
  square(type: 'square');

  final String type;

  const AppButtonType({required this.type});
}

abstract class AppButtonBaseBuilder extends StatelessWidget {
  @protected
  final String? buttonText;
  @protected
  final bool? isDisabled;
  @protected
  final Widget? prefixIcon;
  @protected
  final TextStyle? textStyle;
  @protected
  final AppButtonSize? appButtonSize;
  @protected
  final AppButtonType? appButtonType;
  @protected
  final void Function()? onPressed;

  const AppButtonBaseBuilder({
    super.key,
    this.buttonText,
    this.isDisabled,
    this.prefixIcon,
    this.textStyle,
    this.appButtonSize,
    this.appButtonType,
    this.onPressed,
  });
}
