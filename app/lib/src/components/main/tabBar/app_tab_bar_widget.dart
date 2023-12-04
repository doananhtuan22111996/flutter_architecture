import 'package:app/src/components/main/tabBar/app_tab_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';

class AppTabBarWidget extends StatefulWidget {
  const AppTabBarWidget({
    super.key,
    required this.tabs,
    required this.index,
    this.isScrollable = false,
    this.pages,
    this.onTap,
  });

  final List<AppTabBaseBuilder> tabs;
  final int index;
  final bool isScrollable;
  final List<Widget>? pages;
  final Function(int)? onTap;

  @override
  State<AppTabBarWidget> createState() => _AppTabBarWidgetState();
}

class _AppTabBarWidgetState extends State<AppTabBarWidget>
    with TickerProviderStateMixin {
  TabController? _tabController;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _initController();
  }

  @override
  void didUpdateWidget(covariant AppTabBarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index) {
      _tabController?.animateTo(widget.index);
      _pageController?.animateToPage(widget.index,
          duration: kTabScrollDuration, curve: Curves.ease);
    }
    if (oldWidget.tabs.length != widget.tabs.length) {
      _tabController?.dispose();
      _pageController?.dispose();
      _tabController = null;
      _pageController = null;
      _initController();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.pages?.isNotEmpty == true) {
      return Column(
        children: [
          _tabBar,
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [...widget.pages ?? List.empty()],
              onPageChanged: (index) => widget.onTap?.call(index),
            ),
          ),
        ],
      );
    }
    return _tabBar;
  }

  void _initController() {
    _tabController = TabController(
        initialIndex: widget.index, length: widget.tabs.length, vsync: this);
    _pageController = PageController(initialPage: widget.index);
  }

  TabBar get _tabBar => TabBar(
        controller: _tabController,
        tabs: widget.tabs
            .map((e) =>
                e.copyWith(isSelected: widget.tabs.indexOf(e) == widget.index))
            .toList(),
        isScrollable: widget.isScrollable,
        onTap: widget.onTap,
        padding: EdgeInsets.zero,
        labelPadding: EdgeInsets.zero,
        dividerColor: Colors.transparent,
        indicatorColor: AppColors.of.primaryColor,
        indicatorPadding: EdgeInsets.zero,
        indicatorSize: TabBarIndicatorSize.tab,
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) => AppColors.of.neutralColor[3],
        ),
      );
}
