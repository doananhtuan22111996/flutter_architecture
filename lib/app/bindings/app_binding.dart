part of '../../main.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() async {
    Get.put<AppSharedPref>(AppSharedPref());
    Get.put<EnvironmentService>(EnvironmentService());
    Get.put(NetworkService(Get.find(), Get.find()));

    Get.put<AppHiveDb<TravelUserVo>>(TravelUserBox());

    Get.lazyPut<AuthRepository>(
        () => AuthRepositoryImpl(Get.find(), Get.find()));
    Get.lazyPut<AuthUseCase>(() => AuthUseCaseImpl(Get.find()));

    Get.lazyPut<UserRepository>(
        () => UserRepositoryImpl(Get.find(), Get.find()));
    Get.lazyPut<UserUseCase>(() => UserUseCaseImpl(Get.find()));
  }
}
