import 'package:flutter/material.dart';

class AppTextCheckBoxWidget extends StatelessWidget {
  const AppTextCheckBoxWidget(
      {Key? key, required this.value, required this.child, this.onChanged})
      : super(key: key);

  final Widget child;
  final bool value;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 18,
          height: 18,
          child: Checkbox(value: value, onChanged: onChanged),
        ),
        const SizedBox(width: 11),
        Expanded(child: child),
      ],
    );
  }
}
