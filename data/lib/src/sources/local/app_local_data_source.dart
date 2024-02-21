part of 'base_local_data_source.dart';

abstract class AppLocalDataSource {
  Future<String> getLanguageCode();

  Future<void> setLanguageCode(String langCode);
}

class AppLocalDataSourceImpl extends AppLocalDataSource {
  late final AppSharedPref _pref;

  AppLocalDataSourceImpl(this._pref);

  @override
  Future<String> getLanguageCode() async {
    try {
      final langCode = _pref.getString(AppPrefKey.languageCode, '');
      return langCode;
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
}
