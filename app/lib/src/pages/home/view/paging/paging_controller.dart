import 'package:app/src/components/main/listView/app_list_controller.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utilities/utilities.dart';

import '../../../../components/features/paging_item_widget.dart';
import '../../home_controller.dart';

part 'paging_view.dart';

class PagingController extends AppListController<UserModel> {
  late final PagingRemoteUseCase _pagingRemoteUseCase;

  PagingController(this._pagingRemoteUseCase);

  @override
  Future<AppListResultModel<UserModel>> onCall(ListParam appParam) async {
    await Get.find<HomeController>().executeGetLangCode();
    return _pagingRemoteUseCase.execute(PagingParam(
        page: appParam.page, lang: Get.find<HomeController>().langCode.value));
  }

  @override
  void onInit() {
    super.onInit();
    Logs.d('on Init PagingController');
    data.listen((value) {
      Get.find<HomeController>()
          .onNumberChanged(index: 0, number: value.length);
    });
  }

  @override
  void onClose() {
    super.onClose();
    Logs.d('on Close PagingController');
  }
}
