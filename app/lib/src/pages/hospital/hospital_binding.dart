part of 'hospital_controller.dart';

class HospitalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HospitalController>(() => HospitalController(Get.find()));
  }
}
