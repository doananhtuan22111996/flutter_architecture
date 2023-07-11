import 'package:get/get.dart';

import 'usecases/base_use_case.dart';

class DomainProvider {
  static void inject() {
    Get.put<LoginUseCase>(LoginUseCaseImpl(Get.find()));
    Get.put<GetUserUseCase>(GetUserUseCaseImpl(Get.find()));
    Get.put<GetUserLocalUseCase>(GetUserLocalUseCaseImpl(Get.find()));
  }
}
