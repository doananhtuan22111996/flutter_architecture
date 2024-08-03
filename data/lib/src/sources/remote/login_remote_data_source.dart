part of 'base_remote_data_source.dart';

abstract class LoginRemoteDataSource {
  Future<AppObjResultRaw<TokenRaw>> login();
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  late final NetworkService _networkService;

  LoginRemoteDataSourceImpl(this._networkService);

  @override
  Future<AppObjResultRaw<TokenRaw>> login() async {
    try {
      final AppResponse response = await _networkService.request(
        clientRequest: ClientRequest.request(
          ApiProvider.login,
          HttpMethod.post,
        ),
      );
      return response.toRaw((data) => TokenRaw.fromJson(data));
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
