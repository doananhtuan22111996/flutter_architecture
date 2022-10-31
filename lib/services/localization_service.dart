part of 'app_service.dart';

abstract class LocalizationService extends GetxService implements Translations {
  static Map<String, Locale> supportedLanguages = {
    'en': const Locale('en', 'US'),
    'vi': const Locale('vi', 'VN'),
  };

  Locale? get defaultLanguage;
  Locale? get fallbackLocale;
  void saveLocalization(String code);
  void changeLocalization(String code);
}

class _LocalizationServiceImpl extends LocalizationService
    implements Translations {
  final _box = GetStorage();

  _LocalizationServiceImpl();
  // supported languages

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUs,
        'vi_VN': viVN,
      };

  @override
  Locale? get defaultLanguage =>
      LocalizationService.supportedLanguages[_loadLanguage()];

  @override
  Locale? get fallbackLocale => LocalizationService.supportedLanguages['vi'];

  String _loadLanguage() => _box.read(AppPrefKey.language) ?? 'vi';

  @override
  void saveLocalization(String code) => _box.write(AppPrefKey.language, code);

  @override
  void changeLocalization(String code) => Get.updateLocale(
      LocalizationService.supportedLanguages[code] ?? defaultLanguage!);
}
