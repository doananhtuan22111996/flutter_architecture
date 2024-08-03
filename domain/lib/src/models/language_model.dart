part of 'base_model.dart';

enum AppLanguageKey {
  en(langCode: 'en', countryCode: 'EN'),
  vi(langCode: 'vi', countryCode: 'VN');

  final String langCode;
  final String countryCode;

  const AppLanguageKey({required this.langCode, required this.countryCode});
}

@CopyWith()
class LanguageModel extends BaseModel {
  final String countryCode;
  final String langCode;
  final String name;

  LanguageModel(
      {required this.countryCode, required this.langCode, required this.name});
}
