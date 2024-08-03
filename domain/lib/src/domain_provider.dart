import 'package:domain/domain.dart';
import 'package:get/get.dart';

import 'usecases/base_use_case.dart';

class DomainProvider {
  static void inject() {
    Get.put<AppUseCase>(AppUseCaseImpl(Get.find()));
    Get.put<LoginUseCase>(LoginUseCase(Get.find()));
    Get.put<PagingRemoteUseCase>(PagingRemoteUseCase(Get.find()));
    Get.put<PagingLocalUseCase>(PagingLocalUseCase(Get.find()));
    Get.put<PagingRemoteRemoveItemUseCase>(
        PagingRemoteRemoveItemUseCase(Get.find()));
    Get.put<PagingLocalRemoveItemUseCase>(
        PagingLocalRemoveItemUseCase(Get.find()));
  }
}
