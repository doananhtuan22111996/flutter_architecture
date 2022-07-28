import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pull_to_refresh_plus/pull_to_refresh_plus.dart';

import '../../../../data/network/nets/app_exception.dart';
import '../../../../data/network/nets/app_result.dart';
import '../../../../domain/models/base_model.dart';
import '../app_text_widget.dart';

part 'app_list_widget.dart';

abstract class AppListController<BM extends BaseModel> extends GetxController {
  Rxn<List<BM>> data = Rxn();
  Rxn<AppException> appException = Rxn<AppException>();
  int _page = 1;

  @override
  void onInit() {
    _initFetch();
    super.onInit();
  }

  void _initFetch() async {
    Get.context?.loaderOverlay.show();
    final response = await onInitCall(_page);
    Get.context?.loaderOverlay.hide();
    if (response is AppResultSuccess<List<BM>>) {
      data.value = [...response.netData ?? List.empty()];
    }
    if (response is AppResultFailure) {
      appException.value = (response as AppResultFailure).exception;
    }
  }

  Future<void> onRefreshCall() async {
    _page = 1;
    final response = await onRefresh(_page);
    if (response is AppResultSuccess<List<BM>>) {
      data.value = [...response.netData ?? List.empty()];
    }
    if (response is AppResultFailure) {
      appException.value = (response as AppResultFailure).exception;
    }
  }

  Future<void> onLoadMoreCall() async {
    _page = _page + 1;
    final response = await onLoadMore(_page);
    if (response is AppResultSuccess<List<BM>>) {
      data.value = [
        ...data.value ?? List.empty(),
        ...response.netData ?? List.empty()
      ];
    }
    if (response is AppResultFailure) {
      appException.value = (response as AppResultFailure).exception;
    }
  }

  Future<AppResult<List<BM>>> onInitCall(int page);

  Future<AppResult<List<BM>>> onRefresh(int page);

  Future<AppResult<List<BM>>> onLoadMore(int page);
}
