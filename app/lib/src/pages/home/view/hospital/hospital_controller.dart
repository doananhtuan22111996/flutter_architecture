import 'package:app/src/components/main/listView/app_list_controller.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/pages/home/home_controller.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utilities/utilities.dart';

part 'hospital_view.dart';

class HospitalController extends AppListController<HospitalModel> {
  late final HospitalRemoteUseCase _hospitalRemoteUseCase;

  HospitalController(this._hospitalRemoteUseCase);

  @override
  void onInit() {
    super.onInit();
    Logs.e('on Init HospitalController');
    total.listen((value) {
      Get.find<HomeController>().onNumberChanged(index: 1, number: value);
    });
  }

  @override
  void onClose() {
    super.onClose();
    Logs.e('on Close HospitalController');
  }

  @override
  Future<AppListResultModel<HospitalModel>> onCall(AppParam appParam) {
    return _hospitalRemoteUseCase.execute(query: appParam.toJson);
  }
}
