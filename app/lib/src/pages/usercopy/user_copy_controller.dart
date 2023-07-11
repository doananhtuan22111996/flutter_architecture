import 'package:app/src/components/main/appBar/app_bar_base_builder.dart';
import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/listView/app_list_controller.dart';
import 'package:app/src/components/main/page/app_main_page_base_builder.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';
import 'package:utilities/utilities.dart';

part 'user_copy_binding.dart';

part 'user_copy_page.dart';

class UserCopyController extends AppListController<UserModel> {
  late final GetUserUseCase _useCase;

  UserCopyController(this._useCase);

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
