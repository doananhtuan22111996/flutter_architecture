part of 'base_use_case.dart';

abstract class AppUseCase {
  Future<String> getLanguageCode();

  Future<void> setLanguageCode(String langCode);
}

class AppUseCaseImpl extends AppUseCase {
  late final AppRepository _repo;

  AppUseCaseImpl(this._repo);

  @override
  Future<String> getLanguageCode() => _repo.getLanguageCode();

  @override
  Future<void> setLanguageCode(String langCode) =>
      _repo.setLanguageCode(langCode);
}
