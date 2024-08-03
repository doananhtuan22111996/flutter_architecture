import 'package:data/src/raws/base_raw.dart';
import 'package:domain/domain.dart';

import '../sources/local/base_local_data_source.dart';
import '../sources/remote/base_remote_data_source.dart';

class LoginRepositoryImpl extends LoginRepository {
  late final LoginRemoteDataSource _loginRemoteDataSource;
  late final LoginLocalDataSource _loginLocalDataSource;

  LoginRepositoryImpl(this._loginRemoteDataSource, this._loginLocalDataSource);

  @override
  Future<AppObjResultModel<TokenModel>> login() async {
    try {
      final AppObjResultRaw<TokenRaw> response =
          await _loginRemoteDataSource.login();
      await _loginLocalDataSource.saveToken(
          token: response.netData?.token ?? "",
          refreshToken: response.netData?.refreshToken ?? "");
      return response.raw2Model();
    } on NetworkException {
      rethrow;
    } on LocalException {
      rethrow;
    }
  }
}
