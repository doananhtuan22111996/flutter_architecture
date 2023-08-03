import 'package:app/src/components/main/appBar/app_bar_base_builder.dart';
import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/listView/app_list_controller.dart';
import 'package:app/src/components/main/page/app_main_page_base_builder.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/exts/app_exts.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';
import 'package:utilities/utilities.dart';

part 'hospital_local_binding.dart';

part 'hospital_local_page.dart';

class HospitalLocalController extends AppListController<HospitalModel> {
  late final HospitalLocalUseCase _hospitalLocalUseCase;
  late final HospitalLocalDeleteUseCase _hospitalLocalDeleteUseCase;
  late final HospitalLocalDeleteAtUseCase _hospitalLocalDeleteAtUseCase;

  HospitalLocalController(this._hospitalLocalUseCase,
      this._hospitalLocalDeleteUseCase, this._hospitalLocalDeleteAtUseCase);

  @override
  Future<AppListResultModel<HospitalModel>> onCall(AppParam appParam) {
    return _hospitalLocalUseCase.execute();
  }

  @override
  void onInit() {
    super.onInit();
    Logs.e('on Init HospitalController');
  }

  @override
  void onClose() {
    super.onClose();
    Logs.e('on Close HospitalController');
  }

  void onRequestDeleteAll() async {
    try {
      await _hospitalLocalDeleteUseCase.execute();
      await onRefreshCall();
    } on AppException catch (e) {
      AppExceptionExt(
              appException: e,
              onError: (err) {
                // TODO show noti error
              })
          .detected();
    }
  }

  void onRequestDeleteAt({required String id}) async {
    try {
      await _hospitalLocalDeleteAtUseCase.execute(id: id);
      await onRefreshCall();
    } on AppException catch (e) {
      AppExceptionExt(
              appException: e,
              onError: (err) {
                // TODO show noti error
              })
          .detected();
    }
  }
}
