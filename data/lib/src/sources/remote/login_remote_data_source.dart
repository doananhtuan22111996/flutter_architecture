part of 'base_remote_data_source.dart';

abstract class LoginRemoteDataSource {
  Future<AppObjResultRaw<TokenRaw>> login({required Map<String, dynamic> body});

  Future<AppObjResultRaw<EmptyRaw>> initSession(
      {required Map<String, dynamic> body});
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  late final NetworkService _networkService;

  LoginRemoteDataSourceImpl(this._networkService);

  @override
  Future<AppObjResultRaw<TokenRaw>> login(
      {required Map<String, dynamic> body}) async {
    try {
      final AppResponse response = await _networkService.request(
        clientRequest: ClientRequest(
          url: ApiProvider.login,
          method: HttpMethod.post,
          body: {...body},
        ),
      );
      return response.toRaw((data) => TokenRaw.fromJson(data));
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppObjResultRaw<EmptyRaw>> initSession(
      {required Map<String, dynamic> body}) async {
    try {
      final AppResponse response = await _networkService.request(
        clientRequest: ClientRequest(
          url: ApiProvider.session,
          method: HttpMethod.post,
          body: {
            'loginType': 'username_password',
            'deviceId': '12312312312312312312312'
          },
        ),
      );
      return response.toRaw((data) => EmptyRaw());
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
