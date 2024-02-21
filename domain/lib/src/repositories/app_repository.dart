part of 'base_repository.dart';

abstract class AppRepository {
  Future<String> getLanguageCode();
  
  Future<void> setLanguageCode(String langCode);
}
