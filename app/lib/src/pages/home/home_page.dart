part of 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  static void open() {
    Get.toNamed(Routes.home);
  }

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
          SizedBox(height: AppThemeExt.of.majorScale(2)),
          AppFilledButtonWidget()
              .setButtonText(R.strings.login)
              .setOnPressed(() => controller.executeLogin())
              .build(context),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: AppThemeExt.of.majorScale(2)),
            child: Obx(
              () => AppTextBody1Widget()
                  .setText(
                      controller.tokenModel.value?.token ?? R.strings.notLogin)
                  .setMaxLines(1)
                  .setTextOverFlow(TextOverflow.ellipsis)
                  .build(context),
            ),
          ),
          AppFilledButtonWidget()
              .setButtonText(R.strings.getListNetwork)
              .setOnPressed(() => Get.toNamed(Routes.users))
              .build(context),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: AppThemeExt.of.majorScale(2)),
            child: AppOutlinedButtonWidget()
                .setButtonText(
                    '${R.strings.getListNetwork} Multiple controller')
                .setOnPressed(() => Get.toNamed(Routes.usersCopy))
                .build(context),
          ),
          AppFilledButtonWidget()
              .setButtonText(R.strings.getListDb)
              .setOnPressed(() => Get.toNamed(Routes.dbUsers))
              .build(context),
          Obx(() => ToggleButtons(
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
              )),
          const SizedBox(height: 16),
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
      ),
    );
  }
}
