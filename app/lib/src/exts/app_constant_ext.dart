part of 'app_exts.dart';

class AppConstants {
  AppConstants._();

  static const code = 'code';
  static const basic = 'Basic';
  static const bearer = 'Bearer';
  static const pageLimit = 25;
}

enum AppLanguageKey {
  vi(langCode: 'vi', countryCode: 'VN'),
  en(langCode: 'en', countryCode: 'EN');

  final String langCode;
  final String countryCode;

  const AppLanguageKey({required this.langCode, required this.countryCode});
}
