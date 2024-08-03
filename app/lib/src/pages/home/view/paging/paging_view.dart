part of 'paging_controller.dart';

class PagingView extends GetWidget<PagingController> {
  const PagingView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppListWidget<UserModel, PagingController>(
      childWidget: (ctx, model, index) {
        return PagingItemWidget(model: model, index: index);
      },
    );
  }
}
