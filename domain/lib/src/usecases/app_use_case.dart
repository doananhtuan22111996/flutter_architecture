part of 'base_use_case.dart';

// TODO refactor this class
abstract class AppUseCase {
  Future<String> getLanguageCode();

  Future<void> setLanguageCode(String langCode);

  Future<String> getThemeMode();

  Future<void> setThemeMode(String mode);
}

class AppUseCaseImpl extends AppUseCase {
  late final AppRepository _repo;

  AppUseCaseImpl(this._repo);

  @override
  Future<String> getLanguageCode() => _repo.getLanguageCode();

  @override
  Future<void> setLanguageCode(String langCode) =>
      _repo.setLanguageCode(langCode);

  @override
  Future<String> getThemeMode() => _repo.getThemeMode();

  @override
  Future<void> setThemeMode(String mode) => _repo.setThemeMode(mode);
}
