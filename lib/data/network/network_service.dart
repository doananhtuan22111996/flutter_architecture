import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../services/environment_service.dart';
import '../local/app_pref_key.dart';
import '../local/app_shared_pref.dart';
import 'nets/app_exception.dart';
import 'nets/app_response.dart';
import 'nets/app_result.dart';

part 'api_provider.dart';
part 'client_request.dart';

class NetworkService extends GetxService {
  static const requestTimeOut = Duration(seconds: 15);

  late final Logger _logger;
  late final EnvironmentService _env;
  late final AppSharedPref _pref;
  late final GetConnect _client;

  NetworkService(this._env, this._pref);

  final Map<String, String> _headers = {};

  @override
  void onInit() {
    _logger = Logger(printer: PrettyPrinter());
    _client = GetConnect(timeout: requestTimeOut);
    super.onInit();
  }

  Future<void> _configConnect(Map<String, String> requestHeader) async {
    _client.baseUrl = await _env.apiDomain();
    final token = await _pref.getValue(AppPrefKey.token, '');
    if (token.isNotEmpty == true) {
      _headers.addAll({'Authorization': 'Bearer $token'});
    }
    _headers.addAll(requestHeader);
  }

  Future<AppResult<AppResponse>> request({
    required ClientRequest clientRequest,
  }) async {
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
      _logger.i(
          'Request Network Service: ${_client.baseUrl}${clientRequest.url} - header: $_headers \n Response Network Service: ${response.statusCode} - ${response.statusText} - Response Body: ${response.body}');
      switch (response.statusCode) {
        case 200:
          return AppResult.success(AppResponse.fromJson(response.body is String
              ? jsonDecode(response.body)
              : response.body));

        case 400:
          return AppResult.failure(
              BadRequestException(response.body.toString()));
        case 401:
        case 403:
          return AppResult.failure(UnAuthorException(response.body.toString()));
        case 404:
          return AppResult.failure(
              BadRequestException(response.body.toString()));
        case 500:
          return AppResult.failure(FetchDataException('Internal Server Error'));
        default:
          return AppResult.failure(FetchDataException(
              'Error occured while Communication with Server with StatusCode : ${response.statusCode}'));
      }
    } on TimeoutException catch (_) {
      _logger.e('Response: TimeOutException');
      return AppResult.failure(TimeOutException(null));
    } on SocketException {
      _logger.e('Response: No Internet connection');
      return AppResult.failure(FetchDataException('No Internet connection'));
    } catch (e) {
      _logger.e('Some things wrong: ${e.toString()}');
      return AppResult.failure(
          FetchDataException('Some things wrong: ${e.toString()}'));
    }
  }
}
