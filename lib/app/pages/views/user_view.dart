part of '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(text: Strings.users.tr),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Obx(
            () => (controller.users.value?.length ?? 0) > 0
                ? Expanded(
                    child: ListView.builder(
                      itemCount: controller.users.value?.length ?? 0,
                      itemBuilder: (ctx, index) {
                        return Column(children: [
                          Text(controller.users.value?[index].userName ?? ''),
                          Text(controller.users.value?[index].id.toString() ??
                              (-1).toString()),
                        ]);
                      },
                    ),
                  )
                : Text(controller.appException.value?.message ??
                    Strings.noError.tr),
          ),
        ],
      ),
    );
  }
}
