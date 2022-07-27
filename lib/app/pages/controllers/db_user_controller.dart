import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/network/nets/app_exception.dart';
import '../../../domain/models/base_model.dart';
import '../../../domain/usecases/user_use_case.dart';
import '../../components/main/app_main_widget.dart';
import '../../config/translations/strings_enum.dart';

part '../bindings/db_user_binding.dart';
part '../views/db_user_view.dart';

class DbUserController extends GetxController {
  late final UserUseCase _userUseCase;

  DbUserController(this._userUseCase);

  Rxn<List<TravelUserModel>> dbUsers = Rxn();
  Rxn<AppException> dbError = Rxn();

  @override
  void onInit() {
    executeDbUsers();
    super.onInit();
  }

  void executeDbUsers() async {
    try {
      final response = await _userUseCase.dbUsers();
      dbUsers.value = [...response];
    } on AppException catch (e) {
      dbError.value = e;
    }
  }
}
