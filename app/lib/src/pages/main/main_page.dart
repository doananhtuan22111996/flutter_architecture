part of 'main_controller.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
      appBar: AppBarWidget(headerPage: R.strings.homeView).build(context),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppThemeExt.of.majorScale(4)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ui(context),
            if (!kIsWeb) _data(context),
            _theme(context),
          ],
        ),
      ),
    );
  }

  Widget _ui(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppThemeExt.of.majorScale(2)),
          child: const AppTextHeading5Widget(text: 'UI Kit'),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppFilledButtonWidget(
                  buttonText: R.strings.button,
                  onPressed: () => ButtonPage.open(),
                ),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget(
                  buttonText: R.strings.avatar,
                  onPressed: () => AvatarPage.open(),
                ),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget(
                  buttonText: R.strings.datePicker,
                  onPressed: () => DatePickerPage.open(),
                ),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget(
                  buttonText: R.strings.textField,
                  onPressed: () => TextFieldPage.open(),
                ),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget(
                  buttonText: 'Badge',
                  onPressed: () => BadgePage.open(),
                ),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget(
                  buttonText: 'Toast',
                  onPressed: () => ToastPage.open(),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppFilledButtonWidget(
                  buttonText: R.strings.dialog,
                  onPressed: () => DialogPage.open(),
                ),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget(
                  buttonText: R.strings.progress,
                  onPressed: () => ProgressPage.open(),
                ),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget(
                  buttonText: R.strings.selectionControl,
                  onPressed: () => SelectionControlPage.open(),
                ),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget(
                  buttonText: 'TabBar',
                  onPressed: () => TabBarPage.open(),
                ),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget(
                  buttonText: 'Tooltip',
                  onPressed: () => TooltipPage.open(),
                ),
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
          child: const AppTextHeading5Widget(text: 'Flow Data'),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppFilledButtonWidget(
              buttonText: 'Workflow',
              onPressed: () => LoginPage.open(),
            ),
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
            padding:
                EdgeInsets.symmetric(vertical: AppThemeExt.of.majorScale(2)),
            child: const AppTextHeading5Widget(text: 'Theme style')),
        AppTextBody2Widget(text: R.strings.changeLanguage),
        Obx(
          () => ToggleButtons(
            isSelected: [
              controller.langCode.value == AppLanguageKey.en.langCode,
              controller.langCode.value == AppLanguageKey.vi.langCode,
            ],
            onPressed: (int index) async {
              final langCode = index == 0
                  ? AppLanguageKey.en.langCode
                  : AppLanguageKey.vi.langCode;
              controller.executeUpdateLanguage(langCode);
            },
            children: controller.languages
                .map((e) => AppTextBody1Widget(text: e.name))
                .toList(),
          ),
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextBody2Widget(text: R.strings.changeTheme),
        Obx(
          () => ToggleButtons(
            isSelected: [
              controller.theme.value == ThemeMode.light.name,
              controller.theme.value == ThemeMode.dark.name,
            ],
            children: controller.themes
                .map((e) => e == ThemeMode.light.name
                    ? const Icon(Icons.light_mode)
                    : const Icon(Icons.dark_mode))
                .toList(),
            onPressed: (int index) {
              controller.executeUpdateTheme(
                index == 0 ? ThemeMode.light.name : ThemeMode.dark.name,
              );
            },
          ),
        ),
      ],
    );
  }
}
