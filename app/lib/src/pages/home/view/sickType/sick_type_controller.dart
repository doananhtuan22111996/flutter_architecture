import 'package:app/src/components/main/listView/app_list_controller.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/pages/home/home_controller.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utilities/utilities.dart';

part 'sick_type_view.dart';

class SickTypeController extends AppListController<SickTypeModel> {
  late final SickTypeRemoteUseCase _sickTypeRemoteUseCase;

  SickTypeController(this._sickTypeRemoteUseCase);

  @override
  void onInit() {
    super.onInit();
    Logs.e('on Init SickTypeController');
    total.listen((value) {
      Get.find<HomeController>().onNumberChanged(index: 2, number: value);
    });
  }

  @override
  void onClose() {
    super.onClose();
    Logs.e('on Close SickTypeController');
  }

  @override
  Future<AppListResultModel<SickTypeModel>> onCall(AppParam appParam) {
    return _sickTypeRemoteUseCase.execute(query: appParam.toJson);
  }
}
