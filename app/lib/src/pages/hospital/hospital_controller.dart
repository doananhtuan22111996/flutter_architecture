import 'package:app/src/components/main/appBar/app_bar_base_builder.dart';
import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/listView/app_list_controller.dart';
import 'package:app/src/components/main/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';
import 'package:utilities/utilities.dart';

part 'hospital_binding.dart';

part 'hospital_page.dart';

class HospitalController extends AppListController<HospitalModel> {
  late final HospitalRemoteUseCase _hospitalRemoteUseCase;

  HospitalController(this._hospitalRemoteUseCase);

  @override
  Future<AppListResultModel<HospitalModel>> onCall(AppParam appParam) {
    return _hospitalRemoteUseCase.execute(query: appParam.toJson);
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
}
