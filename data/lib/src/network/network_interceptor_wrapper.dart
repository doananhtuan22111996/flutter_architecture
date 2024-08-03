part of 'network_service.dart';

class NetworkInterceptorWrapper extends QueuedInterceptorsWrapper {
  final AppSharedPref _pref = Get.find<AppSharedPref>();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.headers.addAll(_headerToken());

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
      final cloneRequestOpts = err.requestOptions.copyWith();
      final cloneError = err.copyWith();
      final newDio = NetworkService.newDio();
      try {
        final cloneReq = await newDio.request(
          cloneRequestOpts.path,
          options: Options(
            headers: _headerToken(),
            method: cloneRequestOpts.method,
          ),
          data: cloneRequestOpts.data,
          queryParameters: cloneRequestOpts.queryParameters,
          onSendProgress: cloneRequestOpts.onSendProgress,
          onReceiveProgress: cloneRequestOpts.onReceiveProgress,
          cancelToken: cloneRequestOpts.cancelToken,
        );
        newDio.close(force: true);
        if (HttpStatus(cloneReq.statusCode).isOk) {
          return handler.resolve(cloneReq);
        }
        return handler.next(cloneError);
      } catch (_) {
        newDio.close(force: true);
        return handler.next(cloneError);
      }
    }

    return handler.next(err);
  }

  Map<String, String> _headerToken() {
    final token = _pref.getString(AppPrefKey.token, '');
    return token.isEmpty
        ? {AppNetworkKey.authorization: 'Token is empty'}
        : {AppNetworkKey.authorization: '${AppNetworkKey.bearer} $token'};
  }

  Future<bool> _refreshToken() async {
    final newDio = NetworkService.newDio();
    try {
      final refreshToken = _pref.getString(AppPrefKey.refreshToken, '');
      final response = await newDio.get(
        ApiProvider.refreshToken,
        queryParameters: {AppPrefKey.refreshToken: refreshToken},
      );
      final AppResponse appResponse = AppResponse.fromJson(response.data);

      if (HttpStatus(response.statusCode).isOk) {
        final tokenVo = TokenRaw.fromJson(appResponse.data);
        await _pref.setString(AppPrefKey.token, tokenVo.token);
        await _pref.setString(AppPrefKey.refreshToken, tokenVo.refreshToken);
      }
      newDio.close(force: true);
      return HttpStatus(response.statusCode).isOk;
    } catch (_) {
      newDio.close(force: true);
      return false;
    }
  }
}
