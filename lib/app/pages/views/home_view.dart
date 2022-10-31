part of '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppMainWidget(
      appBarWidget: AppBarWidget(
        text: Strings.homeView.tr,
        goBackEnabled: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppFilledButtonWidget(onPressed: () async {
                await controller.executeLogin();
              }, Strings.login.tr),
              Obx(() => Expanded(
                    child: AppTextWidget(controller.tokenModel.value?.token ??
                        controller.appException.value?.details ??
                        Strings.notLogin.tr),
                  )),
            ],
          ),
          AppFilledButtonWidget(onPressed: () {
            Get.rootDelegate.toNamed(Routes.users);
          }, Strings.getListNetwork.tr),
          AppFilledButtonWidget(onPressed: () {
            Get.rootDelegate.toNamed(Routes.dbUsers);
          }, Strings.getListDb.tr),
          AppFilledButtonWidget(
            Strings.disableButton.tr,
            isEnable: false,
          ),
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
                  AppTextWidget(Strings.vietNamLanguage.tr),
                  AppTextWidget(Strings.englishLanguage.tr),
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
                    index == 0 ? ThemeMode.light : ThemeMode.dark);
              },
            ),
          ),
        ],
      ),
    );
  }
}
