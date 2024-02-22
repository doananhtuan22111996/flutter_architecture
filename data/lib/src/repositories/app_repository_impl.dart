import 'package:data/src/sources/local/base_local_data_source.dart';
import 'package:domain/domain.dart';

class AppRepositoryImpl extends AppRepository {
  late final AppLocalDataSource _localDataSource;

  AppRepositoryImpl(this._localDataSource);

  @override
  Future<String> getLanguageCode() => _localDataSource.getLanguageCode();

  @override
  Future<void> setLanguageCode(String langCode) =>
      _localDataSource.setLanguageCode(langCode);

  @override
  Future<String> getThemeMode() => _localDataSource.getThemeMode();

  @override
  Future<void> setThemeMode(String mode) => _localDataSource.setThemeMode(mode);
}
