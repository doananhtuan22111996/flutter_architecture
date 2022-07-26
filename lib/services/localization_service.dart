import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../app/config/translations/strings_enum.dart';
import '../data/local/app_pref_key.dart';

class LocalizationService extends GetxController implements Translations {
  final _box = GetStorage();

  LocalizationService();
  // supported languages
  static Map<String, Locale> supportedLanguages = {
    'en': const Locale('en', 'US'),
    'vi': const Locale('vi', 'VN'),
  };

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUs,
        'vi_VN': viVN,
      };

  Locale? get defaultLanguage => supportedLanguages[_loadLanguage()];
  Locale? get fallbackLocale => supportedLanguages['vi'];

  String _loadLanguage() => _box.read(AppPrefKey.language) ?? 'en';

  void saveLocalization(String code) => _box.write(AppPrefKey.language, code);

  void changeLocalization(String code) => Get.updateLocale(
      LocalizationService.supportedLanguages[code] ?? defaultLanguage!);
}
