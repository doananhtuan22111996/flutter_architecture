import 'package:data/src/raws/base_raw.dart';
import 'package:domain/domain.dart';

import '../sources/local/base_local_data_source.dart';
import '../sources/remote/base_remote_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {
  late final LoginRemoteDataSource _remoteDataSource;
  late final LoginLocalDataSource _localDataSource;

  LoginRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<AppObjResultModel<TokenModel>> login(
      {required Map<String, dynamic> body}) async {
    try {
      final AppObjResultRaw<TokenRaw> remoteData =
          await _remoteDataSource.login(body: body);
      // await _remoteDataSource.initSession(body: {});
      _localDataSource.saveToken(
          token: remoteData.netData?.accessToken ?? '',
          refreshToken: remoteData.netData?.refreshToken ?? '');
      return remoteData.raw2Model();
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
