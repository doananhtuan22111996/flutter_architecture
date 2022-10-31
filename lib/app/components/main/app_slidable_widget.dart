import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AppSlidableWidget extends StatelessWidget {
  const AppSlidableWidget(
      {Key? key,
      required this.child,
      required this.actions,
      this.isDisabled = false})
      : super(key: key);

  final Widget child;
  final bool isDisabled;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: isDisabled
          ? null
          : ActionPane(
              motion: const StretchMotion(),
              children: actions,
            ),
      child: child,
    );
  }
}
