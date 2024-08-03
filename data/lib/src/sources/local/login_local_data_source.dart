part of 'base_local_data_source.dart';

abstract class LoginLocalDataSource {
  Future<void> saveToken({required String token, required String refreshToken});
}

class LoginLocalDataSourceImpl extends LoginLocalDataSource {
  final AppSharedPref _appSharedPref;

  LoginLocalDataSourceImpl(this._appSharedPref);

  @override
  Future<void> saveToken(
      {required String token, required String refreshToken}) async {
    try {
      await _appSharedPref.setString(AppPrefKey.token, token);
      await _appSharedPref.setString(AppPrefKey.refreshToken, refreshToken);
      return Future.value();
    } on Exception catch (e) {
      throw LocalException(
        code: Code.code999,
        message: e.toString(),
        errorCode: ErrorCode.prefError,
      );
    }
  }
}
