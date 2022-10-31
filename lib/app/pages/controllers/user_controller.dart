import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/network/nets/app_result.dart';
import '../../../domain/models/base_model.dart';
import '../../../domain/usecases/user_use_case.dart';
import '../../components/main/app_bar_widget.dart';
import '../../components/main/app_main_widget.dart';
import '../../components/main/listview/app_list_controller.dart';
import '../../config/translations/strings_enum.dart';

part '../bindings/user_binding.dart';
part '../views/user_view.dart';

class UserController extends AppListController<TravelUserModel> {
  late final UserUseCase _userUseCase;

  UserController(this._userUseCase);

  @override
  Future<AppResult<List<TravelUserModel>>> onCall(int page) {
    return _userUseCase.users(page);
  }
}
