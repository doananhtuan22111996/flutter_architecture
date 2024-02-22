part of 'base_local_data_source.dart';

abstract class AppLocalDataSource {
  Future<String> getLanguageCode();

  Future<void> setLanguageCode(String langCode);

  Future<String> getThemeMode();

  Future<void> setThemeMode(String mode);
}

class AppLocalDataSourceImpl extends AppLocalDataSource {
  late final AppSharedPref _pref;

  AppLocalDataSourceImpl(this._pref);

  @override
  Future<String> getLanguageCode() {
    try {
      final langCode = _pref.getString(AppPrefKey.languageCode, '');
      return Future.value(langCode);
    } catch (_) {
      throw LocalException(
          code: Code.code999, message: 'Get langCode failure!');
    }
  }

  @override
  Future<void> setLanguageCode(String langCode) async {
    try {
      await _pref.setString(AppPrefKey.languageCode, langCode);
    } catch (_) {
      throw LocalException(
          code: Code.code999, message: 'Set langCode failure!');
    }
  }

  @override
  Future<String> getThemeMode() {
    try {
      final theme = _pref.getString(AppPrefKey.theme, '');
      return Future.value(theme);
    } catch (_) {
      throw LocalException(code: Code.code999, message: 'Get theme failure!');
    }
  }

  @override
  Future<void> setThemeMode(String mode) async {
    try {
      await _pref.setString(AppPrefKey.theme, mode);
    } catch (_) {
      throw LocalException(code: Code.code999, message: 'Set theme failure!');
    }
  }
}
