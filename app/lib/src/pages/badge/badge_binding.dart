part of 'badge_controller.dart';

class BadgeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BadgeController>(() => BadgeController());
  }
}
