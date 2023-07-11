part of 'user_copy_controller.dart';

class UserCopyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserCopyController>(() => UserCopyController(Get.find()));
  }
}
