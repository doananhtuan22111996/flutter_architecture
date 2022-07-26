import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/network/nets/app_exception.dart';
import '../../../data/network/nets/app_result.dart';
import '../../../domain/models/base_model.dart';
import '../../../domain/usecases/user_use_case.dart';
import '../../components/main/app_bar_widget.dart';
import '../../config/translations/strings_enum.dart';

part '../bindings/user_binding.dart';
part '../views/user_view.dart';
part '../views/db_user_view.dart';

class UserController extends GetxController {
  late final UserUseCase _userUseCase;

  UserController(this._userUseCase);

  Rxn<List<TravelUserModel>> users = Rxn();
  Rxn<AppException> appException = Rxn<AppException>();

  Rxn<List<TravelUserModel>> dbUsers = Rxn();
  Rxn<AppException> dbError = Rxn();

  @override
  void onReady() async {
    await executeUsers();
    await executeDbUsers();
    super.onReady();
  }

  Future<void> executeUsers() async {
    final response = await _userUseCase.users();
    if (response is AppResultSuccess<List<TravelUserModel>>) {
      users.value = response.netData;
    }
    if (response is AppResultFailure) {
      appException.value = (response as AppResultFailure).exception;
    }
  }

  Future<void> executeDbUsers() async {
    try {
      final response = await _userUseCase.dbUsers();
      dbUsers.value = response;
    } on AppException catch (e, _) {
      dbError.value = e;
    }
  }
}
