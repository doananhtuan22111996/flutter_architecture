import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppIconWidget extends StatelessWidget {
  const AppIconWidget(
    this.icon, {
    Key? key,
    this.bgSize = 24,
    this.iconSize = 16,
    this.bgColor,
    this.iconColor,
    this.iconAlignment = Alignment.center,
  }) : super(key: key);

  final IconData icon;
  final double? iconSize;
  final Color? bgColor;
  final Color? iconColor;
  final double? bgSize;
  final Alignment iconAlignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: bgSize,
      height: bgSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bgColor ?? context.theme.backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Icon(icon,
          size: iconSize, color: iconColor ?? context.theme.iconTheme.color),
    );
  }
}
