part of '../controllers/user_controller.dart';

class DbUserView extends GetView<UserController> {
  const DbUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(text: Strings.dbUsers.tr),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Obx(
            () => (controller.dbUsers.value?.length ?? 0) > 0
                ? Expanded(
                    child: ListView.builder(
                      itemCount: controller.dbUsers.value?.length ?? 0,
                      itemBuilder: (ctx, index) {
                        return Column(children: [
                          Text(controller.dbUsers.value?[index].userName ?? ''),
                          Text(controller.dbUsers.value?[index].id.toString() ??
                              (-1).toString()),
                        ]);
                      },
                    ),
                  )
                : Text(controller.dbError.value?.message ?? Strings.noError.tr),
          ),
        ],
      ),
    );
  }
}
