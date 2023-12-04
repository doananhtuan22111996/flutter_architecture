import 'package:flutter/material.dart';
import 'package:get/get.dart';

@Deprecated('TODO remove')
class AppExpansionLabelWidget extends StatefulWidget {
  const AppExpansionLabelWidget({
    Key? key,
    required this.header,
    this.onClose,
    this.defaultExpand = true,
    required this.body,
    this.enable = true,
    this.action,
    this.headerPadding,
  }) : super(key: key);

  final Widget header;
  final Widget body;
  final Widget? action;

  final EdgeInsets? headerPadding;

  final Function? onClose;
  final bool defaultExpand;
  final bool enable;

  @override
  AppExpansionLabelWidgetState createState() => AppExpansionLabelWidgetState();
}

class AppExpansionLabelWidgetState extends State<AppExpansionLabelWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController expandController;

  static final _easeInCurve = CurveTween(curve: Curves.easeInOutCubic);
  static final _halfTurn = Tween<double>(begin: 0.0, end: 0.5);

  final isExpand = true.obs;

  @override
  void dispose() {
    _controller.dispose();
    expandController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    isExpand.value = widget.defaultExpand;
    _controller = AnimationController(
      value: isExpand.value ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    expandController = AnimationController(
      value: isExpand.value ? 1.0 : 0.0,
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          _renderHeader(),
          if (isExpand.value) const Divider(),
          SizeTransition(
            axisAlignment: 1.0,
            sizeFactor: expandController.view,
            child: widget.body,
          ),
        ],
      );
    });
  }

  void changeExpandState() {
    if (!widget.enable) {
      return;
    }
    if (isExpand.value) {
      _controller.reverse();
      expandController.reverse();
    } else {
      _controller.forward();
      expandController.forward();
    }
    isExpand.value = !isExpand.value;
  }

  void collapseWidget() {
    if (!widget.enable) {
      return;
    }
    if (!isExpand.value) {
    } else {
      _controller.reverse();
      expandController.reverse();
      isExpand.value = !isExpand.value;
    }
  }

  Widget _renderHeader() {
    return InkWell(
      onTap: () {
        if (!widget.enable) {
          return;
        }
        if (isExpand.value) {
          _controller.reverse();
          expandController.reverse();
        } else {
          _controller.forward();
          expandController.forward();
        }
        isExpand.value = !isExpand.value;
      },
      child: Container(
        alignment: Alignment.centerLeft,
        width: MediaQuery.of(context).size.width,
        padding:
            widget.headerPadding ?? const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: widget.header,
            ),
            if (widget.action != null)
              widget.action!
            else
              const SizedBox(
                width: 40,
                height: 40,
              ),
            AnimatedBuilder(
              animation: _controller.view,
              builder: (context, _) {
                return RotationTransition(
                  turns: _controller.drive(_halfTurn.chain(_easeInCurve)),
                  child: const Icon(Icons.keyboard_arrow_down_outlined),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
