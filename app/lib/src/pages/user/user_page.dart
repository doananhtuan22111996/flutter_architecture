part of 'user_controller.dart';

class UserPage extends GetWidget<UserController> {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget()
        .setAppBar(AppBarLeadingAvatarWidget()
            .setHeaderPage(R.strings.users)
            .setActions([
      AppButtonAppBarWidget()
          .setPrefixIcon(const Icon(Icons.more_horiz))
          .setOnPressed(() {})
          .build(context),
    ]).build(context))
        .setBody(
      AppListWidget<UserModel, UserController>(
        childWidget: (ctx, model, index) {
          return UserItemWidget(model: model, index: index);
        },
      ),
    ).build(context);
  }
}

class UserItemController extends GetxController {
  int index = 0;

  UserItemController(this.index);

  void setIndex(int index) {
    this.index = index;
    Logs.i('UserItemController new index: $index');
  }

  @override
  void onInit() {
    super.onInit();
    Logs.i('UserItemController init: $index');
  }

  @override
  void onClose() {
    super.onClose();
    Logs.i('UserItemController close: $index');
  }
}

class UserItemWidget extends StatelessWidget {
  final int index;
  final UserModel model;

  const UserItemWidget({super.key, required this.index, required this.model});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserItemController>(
      init: UserItemController(index),
      tag: index.toString(),
      builder: (controller) => Column(
        children: [
          Text(model.userName),
          Text(model.maNongDanFC.toString()),
        ],
      ),
    );
  }
}
