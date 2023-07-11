import 'package:app/src/components/main/appBar/app_bar_base_builder.dart';
import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/listView/app_list_controller.dart';
import 'package:app/src/components/main/page/app_main_page_base_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';
import 'package:utilities/utilities.dart';

part 'user_binding.dart';

part 'user_page.dart';

class UserController extends AppListController<UserModel> {
  static const String tag = 'UserController';
  late final GetUserUseCase _useCase;

  UserController(this._useCase);

  @override
  Future<AppListResultModel<UserModel>> onCall(AppParam appParam) {
    return _useCase.execute(appParam.toJson);
  }

  @override
  void onInit() {
    super.onInit();
    Logs.e('on Init UserController');
  }

  @override
  void onClose() {
    super.onClose();
    Logs.e('on Close UserController');
  }
}
