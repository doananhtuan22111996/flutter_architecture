import 'package:app/src/components/features/paging_item_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utilities/utilities.dart';

import '../../../../components/main/listView/app_list_controller.dart';
import '../../home_controller.dart';

part 'paging_local_view.dart';

class PagingLocalController extends AppListController<UserModel> {
  late final PagingLocalUseCase _pagingLocalUseCase;

  PagingLocalController(this._pagingLocalUseCase);

  @override
  Future<AppListResultModel<UserModel>> onCall(ListParam appParam) {
    return _pagingLocalUseCase.execute(PagingParam(
        page: appParam.page,
        limit: appParam.limit,
        lang: Get.find<HomeController>().langCode.value));
  }

  @override
  void onInit() {
    super.onInit();
    Logs.d('on Init PagingLocalController');
    data.listen((value) {
      Get.find<HomeController>()
          .onNumberChanged(index: 1, number: value.length);
    });
  }

  @override
  void onClose() {
    super.onClose();
    Logs.d('on Close PagingLocalController');
  }
//
// void onRequestDeleteAll() async {
//   try {
//     await _hospitalLocalDeleteUseCase.execute();
//     await onRefreshCall();
//   } on AppException catch (e) {
//     AppExceptionExt(
//             appException: e,
//             onError: (err) {
//               // TODO show noti error
//             })
//         .detected();
//   }
// }
//
// void onRequestDeleteAt({required String id}) async {
//   try {
//     await _hospitalLocalDeleteAtUseCase.execute(id: id);
//     await onRefreshCall();
//   } on AppException catch (e) {
//     AppExceptionExt(
//             appException: e,
//             onError: (err) {
//               // TODO show noti error
//             })
//         .detected();
//   }
// }
}
