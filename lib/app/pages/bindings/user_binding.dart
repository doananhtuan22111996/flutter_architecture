part of '../controllers/user_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppListController<TravelUserModel>>(
      () => UserController(Get.find<UserUseCase>()),
    );
  }
}
