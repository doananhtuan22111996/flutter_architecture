part of 'app_list_controller.dart';

// [AppListWidget] must to child of AppMainNavigateWidget
class AppListWidget<BM extends BaseModel> extends StatelessWidget {
  AppListWidget(
      {required this.childWidget,
      required this.mainController,
      required this.mainTag,
      this.scrollDirection = Axis.vertical,
      this.reverse = false,
      this.scrollController,
      this.physics = const AlwaysScrollableScrollPhysics(),
      Key? key})
      : super(key: key);

  final AppListController<BM> mainController;
  final String mainTag;
  final Widget Function(BuildContext, BM? model, int index) childWidget;
  final Axis scrollDirection;
  final bool reverse;
  final ScrollController? scrollController;
  final ScrollPhysics physics;

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppListController<BM>>(
        init: mainController,
        tag: mainTag,
        builder: (controller) {
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
                  : (controller.data.value?.isEmpty == true
                      ? Center(
                          child: AppTextWidget(Strings.emptyMessage.tr,
                              textStyle: context.textTheme.headline6,
                              textAlign: TextAlign.center),
                        )
                      : ListView.builder(
                          controller: scrollController,
                          scrollDirection: scrollDirection,
                          reverse: reverse,
                          physics: physics,
                          itemCount: controller.data.value?.length ?? 0,
                          itemBuilder: (ctx, index) => childWidget.call(
                              ctx, controller.data.value?[index], index),
                        )),
            ),
          );
        });
  }

  Widget _retry(BuildContext context, AppListController<BM> controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: AppTextWidget(
            Strings.serverError.tr,
            textStyle: context.textTheme.headline6,
          ),
        ),
        SizedBox(
          width: 120,
          child: AppOutlinedButtonWidget(
            Strings.retry.tr,
            onPressed: () => controller.initFetch(),
          ),
        )
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
