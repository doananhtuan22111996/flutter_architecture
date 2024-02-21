part of 'main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController(Get.find()));
  }
}
