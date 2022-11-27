import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh_plus/pull_to_refresh_plus.dart';

import '../../../../data/network/nets/app_exception.dart';
import '../../../../data/network/nets/app_result.dart';
import '../../../../domain/models/base_model.dart';
import '../../../config/translations/strings_enum.dart';
import '../app_loading_indicator.dart';
import '../button/app_outlined_button_widget.dart';
import '../text/app_text_widget.dart';

part 'app_list_widget.dart';

abstract class AppListController<BM extends BaseModel> extends GetxController {
  final Logger _logger = Logger(printer: PrettyPrinter(methodCount: 0));

  Rxn<List<BM>> data = Rxn();
  Rxn<AppException> appException = Rxn<AppException>();
  Rx<int> total = Rx(0);
  Rx<bool> hasMore = Rx(false);

  int _page = 1;

  Future<AppResult<List<BM>>> onCall(int page);

  @override
  void onReady() {
    super.onReady();
    initFetch();
  }

  void initFetch() async {
    AppFullScreenLoadingIndicator.show();
    final response = await onCall(_page);
    AppFullScreenLoadingIndicator.dismiss();
    if (response is AppResultSuccess<List<BM>>) {
      data.value = [...response.netData ?? List.empty()];
      total.value = response.total ?? 0;
      hasMore.value = response.hasMore;
      appException.value = null;
      _logger.i(
          'AppListWidget Init Call: Data length ${data.value?.length} --- total: ${total.value}');
    }
    if (response is AppResultFailure) {
      appException.value = (response as AppResultFailure).exception;
    }
  }

  Future<void> onRefreshCall() async {
    _page = 1;
    final response = await onCall(_page);

    if (response is AppResultSuccess<List<BM>>) {
      data.value = [...response.netData ?? List.empty()];
      total.value = response.total ?? 0;
      hasMore.value = response.hasMore;
      appException.value = null;
      _logger.i(
          'AppListWidget Refresh: Data length ${data.value?.length} --- total: ${total.value}');
    }
    if (response is AppResultFailure) {
      appException.value = (response as AppResultFailure).exception;
    }
  }

  Future<void> onRefreshCallWithLoading() async {
    AppFullScreenLoadingIndicator.show();
    await onRefreshCall();
    AppFullScreenLoadingIndicator.dismiss();
  }

  Future<void> onLoadMoreCall() async {
    _page = _page + 1;
    final response = await onCall(_page);
    if (response is AppResultSuccess<List<BM>>) {
      data.value = [
        ...data.value ?? List.empty(),
        ...response.netData ?? List.empty()
      ];
      total.value = response.total ?? 0;
      hasMore.value = response.hasMore;
      appException.value = null;
    }
    if (response is AppResultFailure) {
      appException.value = (response as AppResultFailure).exception;
    }
  }
}
