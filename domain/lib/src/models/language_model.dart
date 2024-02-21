part of 'base_model.dart';

class LanguageModel extends BaseModel {
  final String countryCode;
  final String langCode;
  final String name;

  LanguageModel(
      {required this.countryCode, required this.langCode, required this.name});
}
