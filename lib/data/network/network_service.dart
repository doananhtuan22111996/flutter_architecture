import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../services/app_service.dart';
import '../../services/environment_service.dart';
import '../entities/base_vo.dart';
import '../local/app_pref_key.dart';
import '../local/app_shared_pref.dart';
import 'nets/app_exception.dart';
import 'nets/app_response.dart';
import 'nets/app_result.dart';

part 'api_provider.dart';
part 'client_request.dart';

abstract class NetworkService extends GetxService {
  Future<AppResult<AppResponse>> request(
      {required ClientRequest clientRequest, bool isRequestForList = false});
}

class NetworkServiceImpl extends NetworkService {
  static const requestTimeOut = Duration(seconds: 15);

  late final Logger _logger;
  late final EnvironmentService _env;
  late final AppSharedPref _pref;
  late final AppService _appService;
  late final GetConnect _client;

  final Map<String, String> _headers = {};

  bool _isRefreshToken = false;

  @override
  void onInit() {
    _logger = Logger(printer: PrettyPrinter(methodCount: 0));
    _env = Get.find();
    _pref = Get.find();
    _appService = Get.find();
    _client = GetConnect(timeout: requestTimeOut);
    super.onInit();
  }

  Future<void> _configConnect(Map<String, String> requestHeader) async {
    _client.baseUrl = _env.apiDomain();
    _headers.clear();
    final token = await _pref.getValue(AppPrefKey.token, '');
    if (token.isNotEmpty == true) {
      _headers.addAll({'Authorization': 'Bearer $token'});
    }
    _headers.addAll(requestHeader);
  }

  @override
  Future<AppResult<AppResponse>> request(
      {required ClientRequest clientRequest,
      bool isRequestForList = false}) async {
    try {
      await _configConnect(clientRequest.headers ?? {});
      final response = await _client.request(
        clientRequest.url,
        clientRequest.method.value,
        body: clientRequest.body,
        contentType: clientRequest.contentType,
        query: clientRequest.query,
        headers: _headers,
        uploadProgress: clientRequest.uploadProgress,
      );
      _logger.d('Header: ${response.request?.headers}');
      _logger.d('Request Url: ${response.request?.url} ');
      _logger.d('Request Body: ${clientRequest.body}');
      _logger.d('Response Network Service: ${response.bodyString}');
      switch (response.statusCode) {
        case 200:
          if (isRequestForList) {
            final bodyRes = AppResponse.fromJsonToList(response.body is String
                ? jsonDecode(response.body)
                : response.body);
            return AppResult.success(
              bodyRes,
              hasMore: bodyRes.hasMore,
              total: bodyRes.total,
            );
          }
          return AppResult.success(
            AppResponse.fromJson(response.body is String
                ? jsonDecode(response.body)
                : response.body),
          );
        case 400:
          return AppResult.failure(
              BadRequestException(details: response.body.toString()));
        case 401:
          // Don't request refreshToken when login
          // Requesting Token -> cancel other requests
          if (clientRequest.url == ApiProvider.login || _isRefreshToken) {
            return AppResult.failure(
                UnAuthorException(details: response.body.toString()));
          }
          _isRefreshToken = true;
          final result = await _requestRefreshToken();
          _isRefreshToken = false;
          if (result is AppResultSuccess) {
            return request(
                clientRequest: clientRequest,
                isRequestForList: isRequestForList);
          } else {
            // force logout
            _appService.forceLogout();
            return AppResult.failure(FetchDataException(
                details: (result as AppResultFailure).exception?.details));
          }
        case 403:
          return AppResult.failure(
              UnAuthorException(details: response.body.toString()));
        case 404:
          return AppResult.failure(
              BadRequestException(details: response.body.toString()));
        case 500:
          return AppResult.failure(
              FetchDataException(details: 'Internal Server Error'));
        default:
          return AppResult.failure(FetchDataException(
              details:
                  'Error occured while Communication with Server with StatusCode : ${response.statusCode}'));
      }
    } on TimeoutException catch (_) {
      _logger.e('Response: TimeOutException');
      return AppResult.failure(TimeOutException());
    } on SocketException {
      _logger.e('Response: No Internet connection');
      return AppResult.failure(
          FetchDataException(details: 'No Internet connection'));
    } catch (e) {
      _logger.e('Some things wrong: ${e.toString()}');
      return AppResult.failure(
          FetchDataException(details: 'Some things wrong: ${e.toString()}'));
    }
  }

  Future<AppResult<dynamic>> _requestRefreshToken() async {
    try {
      final refreshToken = await _pref.getValue(AppPrefKey.refreshToken, '');
      _logger.d('Request Refresh Token: $refreshToken');
      final response = await _client.request(
          ApiProvider.refreshToken, HTTPMethod.get.value,
          body: {'refreshToken': refreshToken});
      _logger.d(
          'Response Refresh Token: ${response.request?.url} --- Body: ${response.body}');
      switch (response.statusCode) {
        case 200:
          final appResponse = AppResponse.fromJson(response.body is String
              ? jsonDecode(response.body)
              : response.body);
          final tokenVo = TokenVo.fromJson(appResponse.data);
          _pref.setValue(AppPrefKey.token, tokenVo.token ?? '');
          _pref.setValue(AppPrefKey.refreshToken, tokenVo.refreshToken ?? '');
          return AppResult.success(response);
        default:
          return AppResult.failure(UnAuthorException(
              details: 'Request Refresh Token Network Failure'));
      }
    } catch (e) {
      _logger
          .d('Request Refresh Token Network Service Failure: ${e.toString()}');
      return AppResult.failure(UnAuthorException(details: e.toString()));
    }
  }
}
