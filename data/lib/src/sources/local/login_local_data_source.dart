part of 'base_local_data_source.dart';

abstract class LoginLocalDataSource {
  void saveToken({required String token, required String refreshToken});
}

class LoginLocalDataSourceImpl extends LoginLocalDataSource {
  late final AppSharedPref _pref;

  LoginLocalDataSourceImpl(this._pref);

  @override
  void saveToken({required String token, required String refreshToken}) {
    _pref.setValue(AppPrefKey.token, token);
    _pref.setValue(AppPrefKey.refreshToken, refreshToken);
  }
}
