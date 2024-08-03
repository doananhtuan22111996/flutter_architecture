part of 'app_list_controller.dart';

// [AppListWidget] must to child of AppMainNavigateWidget
class AppListWidget<BM extends BaseModel, BC extends AppListController<BM>>
    extends GetWidget<BC> {
  AppListWidget({
    required this.childWidget,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.scrollController,
    this.physics = const AlwaysScrollableScrollPhysics(),
    super.key,
  });

  final Widget Function(BuildContext, BM model, int index) childWidget;
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
        onRefresh: () => _onRefresh(controller),
        onLoading: () => _onLoadMore(controller),
        child: controller.appException.value != null
            ? _retry(context, controller)
            : _main(context),
      ),
    );
  }

  Widget _main(BuildContext context) {
    final List<BM> data = controller.data;

    return data.isEmpty
        ? Center(
            child: AppTextHeading3Widget(
              text: R.strings.emptyMessage,
              textAlign: TextAlign.center,
            ),
          )
        : ListView.builder(
            controller: scrollController,
            scrollDirection: scrollDirection,
            reverse: reverse,
            physics: physics,
            itemCount: data.length,
            itemBuilder: (ctx, index) => childWidget.call(
              ctx,
              controller.data[index],
              index,
            ),
          );
  }

  Widget _retry(BuildContext context, AppListController<BM> controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: AppTextHeading3Widget(
            text: R.strings.serverError,
            textAlign: TextAlign.center,
          ),
        ),
        AppFilledButtonWidget(
          buttonText: R.strings.retry,
          onPressed: () => controller.initFetch(),
        ).build(context),
      ],
    );
  }

  void _onRefresh(AppListController<BM> controller) async {
    await controller.onRefreshCall();
    // Always allow pull to refresh
    _refreshController.refreshToIdle();
  }

  void _onLoadMore(AppListController<BM> controller) async {
    if (!controller.hasMore.value) {
      return _refreshController.loadComplete();
    }
    await controller.onLoadMoreCall();
    _refreshController.loadComplete();
  }
}
