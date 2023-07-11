import 'package:app/src/config/app_theme.dart';
import 'package:app/src/exts/app_exts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabModel {
  final String text;
  String? outlinedText;
  bool isSelected;
  Widget page;

  TabModel({
    required this.text,
    this.outlinedText = '',
    this.isSelected = false,
    required this.page,
  });
}

class AppTabBarSwipeableWidget extends StatefulWidget {
  const AppTabBarSwipeableWidget(
    this.tabs, {
    Key? key,
    required this.onTap,
    this.isScrollable = false,
  }) : super(key: key);

  final List<TabModel> tabs;
  final bool isScrollable;
  final Function(int index)? onTap;

  @override
  State<AppTabBarSwipeableWidget> createState() =>
      _AppTabBarSwipeableWidgetState();
}

class _AppTabBarSwipeableWidgetState extends State<AppTabBarSwipeableWidget>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        initialIndex: widget.tabs.indexWhere((element) => element.isSelected),
        length: widget.tabs.length,
        vsync: this);
  }

  @override
  void didUpdateWidget(covariant AppTabBarSwipeableWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.tabs.length == widget.tabs.length) {
      final newIndex = widget.tabs.indexWhere((element) => element.isSelected);
      _tabController?.animateTo(newIndex);
    }
    if (oldWidget.tabs.length != widget.tabs.length) {
      _tabController?.dispose();
      _tabController = null;
      _tabController = TabController(
          initialIndex: widget.tabs.indexWhere((element) => element.isSelected),
          length: widget.tabs.length,
          vsync: this);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      onTap: ((value) => widget.onTap?.call(value)),
      isScrollable: widget.isScrollable,
      labelPadding:
          EdgeInsets.symmetric(horizontal: AppUIConstants.subHorizontalMargin),
      tabs:
          widget.tabs.map((element) => _AppTabBarChildWidget(element)).toList(),
      indicatorColor: context.theme.primaryColor,
      automaticIndicatorColorAdjustment: true,
    );
  }
}

class _AppTabBarChildWidget extends StatelessWidget {
  const _AppTabBarChildWidget(this.tabModel, {Key? key}) : super(key: key);

  final TabModel tabModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: tabModel.tabSize ?? double.infinity,
      height: 48,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // AppTextWidget(
          //   tabModel.text,
          //   maxLines: 1,
          //   overflow: TextOverflow.ellipsis,
          //   textAlign: TextAlign.center,
          //   textStyle: context.textTheme.subtitle1?.copyWith(
          //     color: tabModel.isSelected
          //         ? context.theme.primaryColor
          //         : AppColors.of.neutralColor[40],
          //   ),
          // ),
          if (tabModel.outlinedText?.isNotEmpty == true)
            const SizedBox(width: 8),
          // if (tabModel.outlinedText?.isNotEmpty == true)
          //   AppTextFilledWidget(
          //     tabModel.outlinedText ?? '',
          //     textStyle: context.theme.textTheme.caption?.copyWith(
          //         color: tabModel.isSelected
          //             ? context.theme.colorScheme.onSecondary
          //             : AppColors.of.neutralColor[60]),
          //     color: tabModel.isSelected
          //         ? context.theme.colorScheme.secondary
          //         : AppColors.of.neutralColor[20],
          //   ),
        ],
      ),
    );
  }
}
