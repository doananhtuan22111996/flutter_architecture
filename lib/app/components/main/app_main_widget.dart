import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../data/network/nets/app_exception.dart';

class AppMainWidget extends StatelessWidget {
  const AppMainWidget({
    required this.body,
    Key? key,
    this.scaffoldKey,
    this.appBarWidget,
    this.loadingWidget,
    this.endDrawer,
    this.errorWidget,
    this.onSnackBar,
    this.backgroundColor,
    this.onEndDrawerChanged,
  }) : super(key: key);

  final Widget body;
  final PreferredSizeWidget? appBarWidget;
  final Color? backgroundColor;
  final Widget? loadingWidget, endDrawer;
  final Widget Function(AppException? exception)? errorWidget;
  final Widget Function(String? message)? onSnackBar;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Function(bool)? onEndDrawerChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: context.theme.backgroundColor,
        appBar: appBarWidget,
        endDrawer: endDrawer,
        // EndDrawer for Filter
        endDrawerEnableOpenDragGesture: false,
        onEndDrawerChanged: onEndDrawerChanged,
        body: Stack(
          children: [
            SafeArea(child: body),
            SvgPicture.asset(
              'assets/vectors/appbar_border_left_bottom.svg',
              color: context.theme.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
