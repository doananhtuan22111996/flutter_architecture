part of 'user_copy_controller.dart';

class UserCopyPage extends GetWidget<UserCopyController> {
  const UserCopyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget()
        .setAppBar(
            AppBarLeadingWidget().setHeaderPage(R.strings.users).setActions([
          AppButtonAppBarWidget()
              .setPrefixIcon(const Icon(Icons.more_horiz))
              .setOnPressed(() {})
              .build(context),
        ]).build(context))
        .setBody(AppListWidget<UserModel, UserCopyController>(
          childWidget: (ctx, model, index) => Column(
            children: [
              Text(model.userName),
              Text(model.maNongDanFC.toString()),
            ],
          ),
        ))
        .build(context);
  }
}
