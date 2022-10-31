import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppIconButtonWidget extends StatelessWidget {
  const AppIconButtonWidget(
      {Key? key,
      required this.icon,
      required this.onPressed,
      this.size,
      this.iconColor,
      this.isLeading = false})
      : super(key: key);

  final IconData icon;
  final double? size;
  final Color? iconColor;
  final bool isLeading;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return isLeading
        ? SizedBox(
            width: 56,
            height: 56,
            child: IconButton(
                color: iconColor ?? context.theme.backgroundColor,
                icon: Icon(icon),
                onPressed: () => onPressed.call()),
          )
        : IconButton(
            color: iconColor ?? context.theme.iconTheme.color,
            icon: Icon(icon),
            onPressed: () => onPressed.call());
  }
}
