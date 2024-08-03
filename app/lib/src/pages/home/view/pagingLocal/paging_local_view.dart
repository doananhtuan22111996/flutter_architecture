part of 'paging_local_controller.dart';

class PagingLocalView extends GetWidget<PagingLocalController> {
  const PagingLocalView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppListWidget<UserModel, PagingLocalController>(
      childWidget: (ctx, model, index) {
        return PagingItemWidget(index: index, model: model);
      },
    );
  }
}
