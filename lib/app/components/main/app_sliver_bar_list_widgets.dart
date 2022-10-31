import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSilverBarWidget extends StatelessWidget {
  const AppSilverBarWidget({
    Key? key,
    required this.children,
    required this.expandedHeight,
    this.collapsedHeight,
    this.titleWidget,
    required this.onlyShowTitleWhenCollapsed,
    this.backgroundWidget,
    this.leadingWidget,
    this.actions,
    this.iconThemeData,
  }) : super(key: key);

  final List<Widget> children;
  final double expandedHeight;
  final double? collapsedHeight;
  final Widget? titleWidget;
  final bool onlyShowTitleWhenCollapsed;
  final Widget? backgroundWidget;

  final Widget? leadingWidget;
  final List<Widget>? actions;
  final IconThemeData? iconThemeData;

  @override
  Widget build(BuildContext context) {
    const double decorBorderRadius = 20;
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.white,
          pinned: true,
          snap: true,
          floating: true,
          collapsedHeight: collapsedHeight,
          expandedHeight: expandedHeight + 3 * decorBorderRadius / 4,
          title: titleWidget,
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              children: [
                Container(
                  height: expandedHeight + MediaQuery.of(context).padding.top,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        context.theme.primaryColorLight,
                        context.theme.primaryColor,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(decorBorderRadius),
                    ),
                  ),
                  child: backgroundWidget ??
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.asset('assets/images/topbar_pattern.png')
                        ],
                      ),
                ),
                Container(
                  color: context.theme.colorScheme.onPrimary,
                  height: 3 * decorBorderRadius / 4,
                  padding: const EdgeInsets.only(left: 1),
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(decorBorderRadius),
                        // topRight: Radius.circular(decorBorderRadius),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          leading: leadingWidget,
          actions: actions,
          actionsIconTheme: iconThemeData ??
              const IconThemeData(color: Colors.white, size: 18),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              color: Colors.transparent,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(decorBorderRadius),
                    topRight: Radius.circular(decorBorderRadius),
                  ),
                ),
                child: children.isNotEmpty
                    ? children[0]
                    : SizedBox(
                        height: decorBorderRadius,
                        width: MediaQuery.of(context).size.width,
                      ),
              ),
            ),
            ...children.sublist(1, children.length - 1),
          ]),
        ),
      ],
    );
  }
}
