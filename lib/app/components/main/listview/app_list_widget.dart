part of 'app_list_controller.dart';

// [AppListWidget] must to child of AppMainWidget
class AppListWidget<BM extends BaseModel>
    extends GetView<AppListController<BM>> {
  AppListWidget(
      {required this.childWidget,
      this.padding,
      this.scrollDirection = Axis.vertical,
      this.reverse = false,
      this.scrollController,
      this.physics = const AlwaysScrollableScrollPhysics(),
      Key? key})
      : super(key: key);
  final EdgeInsets? padding;
  final Widget Function(BuildContext, BM? model) childWidget;
  final Axis scrollDirection;
  final bool reverse;
  final ScrollController? scrollController;
  final ScrollPhysics physics;

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: const MaterialClassicHeader(),
        footer: const ClassicFooter(
          loadStyle: LoadStyle.ShowWhenLoading,
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoadMore,
        child: ListView.builder(
          controller: scrollController,
          scrollDirection: scrollDirection,
          reverse: reverse,
          physics: physics,
          padding: padding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          itemCount: controller.data.value?.length ?? 0,
          itemBuilder: (ctx, index) =>
              childWidget.call(ctx, controller.data.value?[index]),
        ),
      ),
    );
  }

  void _onRefresh() async {
    await controller.onRefreshCall();
    // Always allow pull to refresh
    _refreshController.refreshToIdle();
  }

  void _onLoadMore() async {
    await controller.onLoadMoreCall();
    _refreshController.loadComplete();
  }
}
