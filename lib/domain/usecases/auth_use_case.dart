import 'package:flutter/material.dart';

import '../../data/entities/base_vo.dart';
import '../../data/network/nets/app_result.dart';
import '../models/base_model.dart';
import '../models/params/login_param.dart';
import '../repositories/auth_repository.dart';

part '../../data/usecases/auth_use_case_impl.dart';

abstract class AuthUseCase {
  Future<AppResult<TokenModel>> login(LoginParam? params);

  String languageCode();

  void saveLanguageCode(String code);

  bool isDarkTheme();

  void changeThemeMode(ThemeMode themeMode);
}
