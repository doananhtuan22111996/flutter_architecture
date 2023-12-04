part of 'dialog_controller.dart';

class DialogPage extends GetView<DialogController> {
  const DialogPage({Key? key}) : super(key: key);

  static void open() {
    Get.toNamed(Routes.dialog);
  }

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
      appBar: AppBarWidget(
        headerPage: R.strings.dialog,
      ).build(context),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppThemeExt.of.majorScale(4)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppFilledButtonWidget(
                buttonText: 'Dialog Success',
                appButtonSize: AppButtonSize.small,
                onPressed: () => controller.dialogSuccess(),
              ).build(context),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: AppThemeExt.of.majorScale(2)),
                child: AppFilledButtonWidget(
                  buttonText: 'Dialog error',
                  appButtonSize: AppButtonSize.small,
                  onPressed: () => controller.dialogError(),
                ).build(context),
              ),
              AppFilledButtonWidget(
                buttonText: 'Dialog confirm',
                appButtonSize: AppButtonSize.small,
                onPressed: () => controller.dialogConfirm(),
              ).build(context),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppFilledButtonWidget(
                buttonText: 'Dialog Screen Success',
                appButtonSize: AppButtonSize.small,
                onPressed: () => controller.dialogScreenSuccess(),
              ).build(context),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: AppThemeExt.of.majorScale(2)),
                child: AppFilledButtonWidget(
                  buttonText: 'Dialog Screen error',
                  appButtonSize: AppButtonSize.small,
                  onPressed: () => controller.dialogScreenError(),
                ).build(context),
              ),
              AppFilledButtonWidget(
                buttonText: 'Dialog Screen confirm',
                appButtonSize: AppButtonSize.small,
                onPressed: () => controller.dialogScreenConfirm(),
              ).build(context),
            ],
          ),
        ],
      ),
    );
  }
}
