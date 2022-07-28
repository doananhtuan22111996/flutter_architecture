import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/config/theme/app_theme.dart';
import '../../data/entities/base_vo.dart';
import '../../data/local/app_pref_key.dart';
import '../../data/local/app_shared_pref.dart';
import '../../data/network/nets/app_response.dart';
import '../../data/network/nets/app_result.dart';
import '../../data/network/network_service.dart';
import '../../services/localization_service.dart';
import '../../services/theme_service.dart';

part '../../data/repositories/auth_repository_impl.dart';

abstract class AuthRepository {
  Future<AppResult<TokenVo>> login(
      {required String username, required String password});

  Future<void> saveToken({required String token, required String refreshToken});

  String languageCode();

  void saveLanguageCode(String code);

  bool isDarkTheme();

  void changeThemeMode(ThemeMode themeMode);
}
