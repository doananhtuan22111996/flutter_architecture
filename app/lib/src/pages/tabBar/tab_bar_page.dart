part of 'tab_bar_controller.dart';

class TabBarPage extends GetView<TabBarController> {
  const TabBarPage({super.key});

  static void open() {
    Get.toNamed(Routes.tabBar);
  }

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
      appBar: const AppBarWidget(headerPage: 'Tab Bar').build(context),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppThemeExt.of.majorScale(4)),
      child: Column(
        children: [
          _textOnlyMedium(context),
          _textOnlyLarge(context),
          _withIconLarge(context),
          _withNumberLarge(context),
        ],
      ),
    );
  }

  Widget _textOnlyMedium(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppTextBody1Widget(text: 'Text Only Medium'),
        Obx(
          () => AppTabBarWidget(
            tabs: controller.mediumTabs,
            index: controller.mediumIndex.value,
            onTap: ((index) => controller.mediumIndex.value = index),
          ),
        ),
      ],
    );
  }

  Widget _textOnlyLarge(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppTextBody1Widget(text: 'Text Only Large'),
        Obx(
          () => AppTabBarWidget(
            tabs: controller.largeTabs,
            index: controller.largeIndex.value,
            onTap: ((index) => controller.largeIndex.value = index),
          ),
        ),
      ],
    );
  }

  Widget _withIconLarge(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppTextBody1Widget(text: 'With Icon Large'),
        Obx(
          () => AppTabBarWidget(
            tabs: controller.iconTabs,
            index: controller.iconIndex.value,
            onTap: ((index) => controller.iconIndex.value = index),
          ),
        ),
      ],
    );
  }

  Widget _withNumberLarge(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppTextBody1Widget(text: 'With Number Large'),
        Obx(
          () => AppTabBarWidget(
            tabs: controller.numberTabs,
            index: controller.numberIndex.value,
            onTap: ((index) => controller.numberIndex.value = index),
          ),
        ),
      ],
    );
  }
}
