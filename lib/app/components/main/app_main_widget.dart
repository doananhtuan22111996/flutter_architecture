import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../data/network/nets/app_exception.dart';
import 'app_bar_widget.dart';
import 'app_loading_widget.dart';

class AppMainWidget extends StatelessWidget {
  const AppMainWidget({
    required this.textAppBar,
    required this.body,
    this.isGoBack = true,
    Key? key,
    this.loadingWidget,
    this.errorWidget,
    this.emptyWidget,
    this.onSnackBar,
  }) : super(key: key);

  final String textAppBar;
  final Widget body;
  final bool isGoBack;
  final Widget? loadingWidget;
  final Widget Function(AppException? exception)? errorWidget;
  final Widget Function()? emptyWidget;
  final Widget Function(String? message)? onSnackBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        text: textAppBar,
        isGoBack: isGoBack,
      ),
      body: LoaderOverlay(
          overlayWidget: loadingWidget ?? const AppLoadingWidget(),
          child: body),
    );
  }
}
