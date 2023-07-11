part of 'db_user_controller.dart';

class DbUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DbUserController>(() => DbUserController(Get.find()));
  }
}
