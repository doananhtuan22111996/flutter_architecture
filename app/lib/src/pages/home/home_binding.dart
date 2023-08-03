part of 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DoctorController>(() => DoctorController(Get.find()));
    Get.lazyPut<HospitalController>(() => HospitalController(Get.find()));
    Get.lazyPut<SickTypeController>(() => SickTypeController(Get.find()));
  }
}
