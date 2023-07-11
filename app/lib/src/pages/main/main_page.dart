part of 'main_controller.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget()
        .setAppBar(
            AppBarWidget().setHeaderPage(R.strings.homeView).build(context))
        .setBody(_body(context))
        .build(context);
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppThemeExt.of.majorScale(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ui(context),
          _data(context),
        ],
      ),
    );
  }

  Widget _ui(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppThemeExt.of.majorScale(2)),
          child: AppTextHeading5Widget().setText('UI kit').build(context),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppFilledButtonWidget()
                    .setButtonText(R.strings.button)
                    .setOnPressed(() => ButtonPage.open())
                    .build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget()
                    .setButtonText(R.strings.avatar)
                    .setOnPressed(() => AvatarPage.open())
                    .build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget()
                    .setButtonText(R.strings.datePicker)
                    .setOnPressed(() => DatePickerPage.open())
                    .build(context),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppFilledButtonWidget()
                    .setButtonText(R.strings.dialog)
                    .setOnPressed(() => DialogPage.open())
                    .build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget()
                    .setButtonText(R.strings.progress)
                    .setOnPressed(() => ProgressPage.open())
                    .build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget()
                    .setButtonText(R.strings.selectionControl)
                    .setOnPressed(() => SelectionControlPage.open())
                    .build(context),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _data(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppThemeExt.of.majorScale(2)),
          child: AppTextHeading5Widget().setText('Flow Data').build(context),
        ),
        AppFilledButtonWidget()
            .setButtonText('Run')
            .setOnPressed(() => HomePage.open())
            .build(context),
      ],
    );
  }
}
