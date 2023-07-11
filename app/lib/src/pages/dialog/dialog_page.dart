part of 'dialog_controller.dart';

class DialogPage extends GetView<DialogController> {
  const DialogPage({Key? key}) : super(key: key);

  static void open() {
    Get.toNamed(Routes.dialog);
  }

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget()
        .setAppBar(
            AppBarWidget().setHeaderPage(R.strings.dialog).build(context))
        .setBody(_body(context))
        .build(context);
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
              AppFilledButtonWidget()
                  .setButtonText('Dialog Success')
                  .setAppButtonSize(AppButtonSize.small)
                  .setOnPressed(() => controller.dialogSuccess())
                  .build(context),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: AppThemeExt.of.majorScale(2)),
                child: AppFilledButtonWidget()
                    .setButtonText('Dialog error')
                    .setAppButtonSize(AppButtonSize.small)
                    .setOnPressed(() => controller.dialogError())
                    .build(context),
              ),
              AppFilledButtonWidget()
                  .setButtonText('Dialog confirm')
                  .setAppButtonSize(AppButtonSize.small)
                  .setOnPressed(() => controller.dialogConfirm())
                  .build(context),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppFilledButtonWidget()
                  .setButtonText('Dialog Screen Success')
                  .setAppButtonSize(AppButtonSize.small)
                  .setOnPressed(() => controller.dialogScreenSuccess())
                  .build(context),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: AppThemeExt.of.majorScale(2)),
                child: AppFilledButtonWidget()
                    .setButtonText('Dialog Screen error')
                    .setAppButtonSize(AppButtonSize.small)
                    .setOnPressed(() => controller.dialogScreenError())
                    .build(context),
              ),
              AppFilledButtonWidget()
                  .setButtonText('Dialog Screen confirm')
                  .setAppButtonSize(AppButtonSize.small)
                  .setOnPressed(() => controller.dialogScreenConfirm())
                  .build(context),
            ],
          ),
        ],
      ),
    );
  }
}
