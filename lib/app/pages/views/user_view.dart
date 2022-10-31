part of '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppMainWidget(
      appBarWidget: AppBarWidget(text: Strings.users.tr),
      body: AppListWidget<TravelUserModel>(
        mainController: Get.find<UserController>(),
        mainTag: 'UserController',
        childWidget: (ctx, model, index) => Column(
          children: [
            Text(model?.userName ?? ''),
            Text(model?.id.toString() ?? (-1).toString()),
          ],
        ),
      ),
    );
  }
}
