part of 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
    Get.lazyPut<PagingController>(() => PagingController(Get.find()));
    Get.lazyPut<PagingLocalController>(() => PagingLocalController(Get.find()));
  }
}
