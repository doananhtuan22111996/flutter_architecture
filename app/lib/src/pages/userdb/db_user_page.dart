part of 'db_user_controller.dart';

class DbUserPage extends GetWidget<DbUserController> {
  const DbUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget()
        .setAppBar(
            AppBarLeadingWidget().setHeaderPage(R.strings.dbUsers).setActions([
          AppButtonAppBarWidget()
              .setPrefixIcon(const Icon(Icons.more_horiz))
              .setOnPressed(() {})
              .build(context),
        ]).build(context))
        .setBody(Column(
          children: [
            AppFilledButtonWidget()
                .setButtonText('Delete All DB')
                .setOnPressed(() => controller.deleteDB())
                .build(context),
            Expanded(
              child: AppListWidget<UserModel, DbUserController>(
                childWidget: (ctx, model, index) => Column(
                  children: [
                    Text(model.userName),
                    Text(model.maNongDanFC.toString()),
                  ],
                ),
              ),
            ),
          ],
        ))
        .build(context);
  }
}
