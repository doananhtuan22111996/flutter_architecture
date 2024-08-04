part of 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  static void open() {
    Get.toNamed(Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
      appBar: AppBarWidget(
        headerPage: R.strings.homeView,
      ).build(context),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Obx(
      () => AppTabBarWidget(
        tabs: [...controller.numberTabs],
        index: controller.numberIndex.value,
        pages: const [
          PagingView(),
          PagingLocalView(),
        ],
        onTap: (index) => controller.numberIndex.value = index,
      ),
    );
  }
}
