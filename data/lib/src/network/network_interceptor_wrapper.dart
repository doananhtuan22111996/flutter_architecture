part of 'network_service.dart';

class NetworkInterceptorWrapper extends QueuedInterceptorsWrapper {
  late final Dio diO;
  final AppSharedPref _pref = Get.find<AppSharedPref>();

  NetworkInterceptorWrapper({required this.diO});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers.addAll(await _headerToken());

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Go Next when call api login || refreshToken
    if (err.requestOptions.path.contains(ApiProvider.login) ||
        err.requestOptions.path.contains(ApiProvider.refreshToken)) {
      return handler.next(err);
    }
    // Do something with response error
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      final isHasToken = await _refreshToken();
      if (!isHasToken) {
        return handler.next(err);
      }
      err.requestOptions.headers.remove(AppNetworkKey.authorization);
      err.requestOptions.headers.addAll(await _headerToken());
      final opts = Options(
        headers: err.requestOptions.headers,
        method: err.requestOptions.method,
      );

      final cloneReq = await diO.request(
        err.requestOptions.path,
        options: opts,
        data: err.requestOptions.data,
        queryParameters: err.requestOptions.queryParameters,
        onSendProgress: err.requestOptions.onSendProgress,
        onReceiveProgress: err.requestOptions.onReceiveProgress,
        cancelToken: err.requestOptions.cancelToken,
      );
      if (HttpStatus(cloneReq.statusCode).isOk) {
        return handler.resolve(cloneReq);
      }
      return handler
          .reject(DioException(requestOptions: err.response!.requestOptions));
    }

    return handler.next(err);
  }

  Future<Map<String, String>> _headerToken() async {
    final token = await _pref.getValue(AppPrefKey.token, '');
    return token.isEmpty
        ? _basicToken
        : {AppNetworkKey.authorization: '${AppNetworkKey.bearer} $token'};
  }

  Map<String, String> get _basicToken => {
        AppNetworkKey.authorization:
            '${AppNetworkKey.basic} ${base64.encode(utf8.encode(BuildConfig.basicToken))}',
      };

  Future<bool> _refreshToken() async {
    final newDio = NetworkService.newDio();
    try {
      final refreshToken = await _pref.getValue(AppPrefKey.refreshToken, '');
      final response = await newDio.get(
        ApiProvider.refreshToken,
        queryParameters: {AppPrefKey.refreshToken: refreshToken},
        options: Options(headers: _basicToken),
      );
      final AppResponse appResponse = AppResponse.fromJson(response.data);

      if (HttpStatus(response.statusCode).isOk) {
        final tokenVo = TokenRaw.fromJson(appResponse.data);
        await _pref.setValue(AppPrefKey.token, tokenVo.accessToken);
        await _pref.setValue(AppPrefKey.refreshToken, tokenVo.refreshToken);
      }
      newDio.close(force: true);

      return HttpStatus(response.statusCode).isOk;
    } catch (_) {
      newDio.close(force: true);

      return false;
    }
  }
}
