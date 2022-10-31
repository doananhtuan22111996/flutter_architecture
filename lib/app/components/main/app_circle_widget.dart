import 'package:flutter/material.dart';

class AppCircleWidget extends StatelessWidget {
  const AppCircleWidget({
    Key? key,
    required this.color,
    this.size = 20,
  }) : super(key: key);

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
