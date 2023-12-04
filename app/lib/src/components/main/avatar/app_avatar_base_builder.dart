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

abstract class AppAvatarBaseBuilder extends StatelessWidget {
  @protected
  final AppAvatarSize? size;
  @protected
  final String? link;
  @protected
  final String? text;
  @protected
  final Widget? svg;
  @protected
  final File? file;
  @protected
  final void Function()? onPressed;

  const AppAvatarBaseBuilder({
    super.key,
    this.size,
    this.link,
    this.text,
    this.svg,
    this.file,
    this.onPressed,
  });
}
