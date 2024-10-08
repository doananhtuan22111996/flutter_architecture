part of 'main_controller.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
      scaffoldKey: controller.scaffoldKey,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
        AppTopBarWidget.large(
          title: R.strings.homeView,
          leading: AppIconButtonWidget(
            icon: Icons.menu,
            onPressed: () => controller.scaffoldKey.currentState?.openDrawer(),
          ),
          forceElevated: innerBoxIsScrolled,
        ),
      ],
      drawer: AppNavigationDrawerWidget(
        children: controller.drawerItems(Theme.of(context)),
      ),
      bottomAppBar: AppBottomBarWidget(
        child: Row(
          children: [
            AppIconButtonWidget(icon: Icons.more_vert, onPressed: () => {}),
            AppIconButtonWidget(icon: Icons.search, onPressed: () => {}),
            AppIconButtonWidget(icon: Icons.favorite, onPressed: () => {}),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => AppToastFloatingWidget.action(
            messageText:
                "Two-line snackbar with action and close affordance, Two-line snackbar with action and close affordance",
            action: SnackBarAction(
              label: R.strings.submit,
              onPressed: () => {},
            )).show(),
        child: const AppIconWidget(icon: Icons.add),
      ),
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
          child:
              Text('UI Kit', style: Theme.of(context).textTheme.headlineSmall),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppFilledButtonWidget.text(
                  label: R.strings.button,
                  onPressed: () => ButtonPage.open(),
                ),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget.text(
                  label: R.strings.datePicker,
                  onPressed: () => DatePickerPage.open(),
                ),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget.text(
                  label: R.strings.textField,
                  onPressed: () => TextFieldPage.open(),
                ),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget.text(
                  label: 'Badge',
                  onPressed: () => BadgePage.open(),
                ),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget.text(
                  label: 'Toast',
                  onPressed: () => ToastPage.open(),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppFilledButtonWidget.text(
                  label: R.strings.dialog,
                  onPressed: () => DialogPage.open(),
                ),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget.text(
                  label: R.strings.progress,
                  onPressed: () => ProgressPage.open(),
                ),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget.text(
                  label: R.strings.checkbox,
                  onPressed: () => CheckboxPage.open(),
                ),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget.text(
                  label: R.strings.radioButton,
                  onPressed: () => RadioButtonPage.open(),
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
          child: Text('Flow Data',
              style: Theme.of(context).textTheme.headlineSmall),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppFilledButtonWidget.text(
              label: 'Workflow',
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
          padding: EdgeInsets.symmetric(vertical: AppThemeExt.of.majorScale(2)),
          child: Text(
            'Theme style',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Text(R.strings.changeLanguage),
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
                .map((e) =>
                    Text(e.name, style: Theme.of(context).textTheme.bodyMedium))
                .toList(),
          ),
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        Text(R.strings.changeTheme),
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
