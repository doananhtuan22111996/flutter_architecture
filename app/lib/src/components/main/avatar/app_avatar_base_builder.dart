import 'dart:io';

import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';

part 'app_avatar_network_widget.dart';

part 'app_avatar_file_widget.dart';

part 'app_avatar_svg_widget.dart';

part 'app_avatar_text_widget.dart';

enum AppAvatarSize {
  small(size: 'small', value: 24),
  medium(size: 'medium', value: 32),
  large(size: 'large', value: 40),
  extraLarge(size: 'extra-large', value: 64);

  final String size;
  final double value;

  const AppAvatarSize({required this.size, required this.value});
}

abstract class AppAvatarBaseBuilder {
  @protected
  AppAvatarSize? _size;
  @protected
  String? _link;
  @protected
  String? _text;
  @protected
  Widget? _svg;
  @protected
  File? _file;
  @protected
  void Function()? _onPressed;

  AppAvatarBaseBuilder setSize(AppAvatarSize? size) {
    _size = size ?? AppAvatarSize.medium;
    return this;
  }

  AppAvatarBaseBuilder setLink(String? link) {
    return this;
  }

  AppAvatarBaseBuilder setText(String? text) {
    return this;
  }

  AppAvatarBaseBuilder setSvg(Widget? svg) {
    return this;
  }

  AppAvatarBaseBuilder setFile(File? file) {
    return this;
  }

  AppAvatarBaseBuilder setOnPressed(void Function()? onPressed) {
    return this;
  }

  Widget build(BuildContext context);
}
