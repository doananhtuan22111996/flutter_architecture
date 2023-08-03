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
          _theme(context),
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
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget()
                    .setButtonText(R.strings.textField)
                    .setOnPressed(() => TextFieldPage.open())
                    .build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget()
                    .setButtonText('Badge')
                    .setOnPressed(() => BadgePage.open())
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
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget()
                    .setButtonText('TabBar')
                    .setOnPressed(() => TabBarPage.open())
                    .build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget()
                    .setButtonText('Tooltip')
                    .setOnPressed(() => TooltipPage.open())
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppFilledButtonWidget()
                .setButtonText('Network')
                .setOnPressed(() => HospitalPage.open())
                .build(context),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppThemeExt.of.majorScale(2)),
              child: AppFilledButtonWidget()
                  .setButtonText('Database')
                  .setOnPressed(() => HospitalLocalPage.open())
                  .build(context),
            ),
            AppFilledButtonWidget()
                .setButtonText('Page View')
                .setOnPressed(() => HomePage.open())
                .build(context),
          ],
        ),
      ],
    );
  }

  Widget _theme(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppThemeExt.of.majorScale(2)),
          child: AppTextHeading5Widget().setText('Theme style').build(context),
        ),
        AppTextBody2Widget().setText(R.strings.changeLanguage).build(context),
        Obx(
          () => ToggleButtons(
            isSelected: [
              controller.lnCode.value == 'vi',
              controller.lnCode.value == 'en'
            ],
            onPressed: (int index) async {
              final code = index == 0 ? 'vi' : 'en';
              controller.executeUpdateLanguage(code);
            },
            children: [
              AppTextBody1Widget()
                  .setText(R.strings.vietNamLanguage)
                  .build(context),
              AppTextBody1Widget()
                  .setText(R.strings.englishLanguage)
                  .build(context),
            ],
          ),
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextBody2Widget().setText(R.strings.changeTheme).build(context),
        Obx(
          () => ToggleButtons(
            isSelected: [
              !controller.isDarkMode.value,
              controller.isDarkMode.value
            ],
            children: const [
              Icon(Icons.light_mode),
              Icon(Icons.dark_mode),
            ],
            onPressed: (int index) {
              controller.executeChangeThemeMode(
                index == 0 ? ThemeMode.light : ThemeMode.dark,
              );
            },
          ),
        ),
      ],
    );
  }
}
