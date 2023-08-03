import 'package:get/get.dart';

import 'usecases/base_use_case.dart';

class DomainProvider {
  static void inject() {
    Get.put<HospitalRemoteUseCase>(HospitalRemoteUseCaseImpl(Get.find()));
    Get.put<HospitalLocalUseCase>(HospitalLocalUseCaseImpl(Get.find()));
    Get.put<HospitalLocalDeleteUseCase>(
        HospitalLocalDeleteUseCaseImpl(Get.find()));
    Get.put<HospitalLocalDeleteAtUseCase>(
        HospitalLocalDeleteAtUseCaseImpl(Get.find()));
    Get.put<DoctorRemoteUseCase>(DoctorRemoteUseCaseImpl(Get.find()));
    Get.put<DoctorLocalUseCase>(DoctorLocalUseCaseImpl(Get.find()));
    Get.put<DoctorLocalDeleteUseCase>(DoctorLocalDeleteUseCaseImpl(Get.find()));
    Get.put<SickTypeRemoteUseCase>(SickTypeRemoteUseCaseImpl(Get.find()));
    Get.put<SickTypeLocalUseCase>(SickTypeLocalUseCaseImpl(Get.find()));
    Get.put<SickTypeLocalDeleteUseCase>(
        SickTypeLocalDeleteUseCaseImpl(Get.find()));
  }
}
