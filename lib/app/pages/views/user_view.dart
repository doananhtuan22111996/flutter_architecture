part of '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppMainWidget(
      textAppBar: Strings.users.tr,
      body: AppListWidget<TravelUserModel>(
        childWidget: (ctx, model) => Column(
          children: [
            Text(model?.userName ?? ''),
            Text(model?.id.toString() ?? (-1).toString()),
          ],
        ),
      ),
    );
  }
}
