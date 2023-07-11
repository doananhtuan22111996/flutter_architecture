part of 'user_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController(Get.find()));
    // Get.create(() => UserItemController());
  }
}
