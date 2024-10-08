import 'package:flutter/material.dart';

part 'app_top_bar_widget.dart';

enum _AppTopBarType {
  small,
  medium,
  large;
}

abstract class _AppTopBarBaseBuilder extends StatelessWidget {
  @protected
  final String title;
  @protected
  final Widget? leading;
  @protected
  final List<Widget>? actions;
  @protected
  final bool forceElevated;
  @protected
  final bool pinned;
  @protected
  final bool floating;
  @protected
  final bool snap;
  @protected
  final PreferredSizeWidget? bottom;

  const _AppTopBarBaseBuilder({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.forceElevated = false,
    this.pinned = true,
    this.floating = false,
    this.snap = false,
    this.bottom,
  });
}
