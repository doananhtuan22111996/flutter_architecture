part of '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppMainWidget(
      textAppBar: Strings.homeView.tr,
      isGoBack: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppButtonWidget(
                  onPressed: () async {
                    await controller.executeLogin();
                  },
                  text: Strings.login.tr),
              Obx(() => Expanded(
                    child: AppTextWidget(
                        text: controller.tokenModel.value?.token ??
                            controller.appException.value?.details ??
                            Strings.notLogin.tr),
                  )),
            ],
          ),
          AppButtonWidget(
              onPressed: () {
                Get.rootDelegate.toNamed(Routes.users);
              },
              text: Strings.getListNetwork.tr),
          AppButtonWidget(
              onPressed: () {
                Get.rootDelegate.toNamed(Routes.dbUsers);
              },
              text: Strings.getListDb.tr),
          AppButtonWidget(
            text: Strings.disableButton.tr,
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
                  AppTextWidget(text: Strings.vietNamLanguage.tr),
                  AppTextWidget(text: Strings.englishLanguage.tr),
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
