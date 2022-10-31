part of '../controllers/db_user_controller.dart';

class DbUserView extends GetView<DbUserController> {
  const DbUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppMainWidget(
      appBarWidget: AppBarWidget(text: Strings.dbUsers.tr),
      body: Obx(
        () => (controller.dbUsers.value?.length ?? 0) > 0
            ? ListView.builder(
                itemCount: controller.dbUsers.value?.length ?? 0,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    Text(controller.dbUsers.value?[index].userName ?? ''),
                    Text(controller.dbUsers.value?[index].id.toString() ??
                        (-1).toString()),
                  ],
                ),
              )
            : Text(controller.dbError.value?.message ?? Strings.noError.tr),
      ),
    );
  }
}
