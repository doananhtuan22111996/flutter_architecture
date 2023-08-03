part of 'hospital_local_controller.dart';

class HospitalLocalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HospitalLocalController>(
      () => HospitalLocalController(
        Get.find(),
        Get.find(),
        Get.find(),
      ),
    );
  }
}
