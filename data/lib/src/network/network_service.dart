import 'dart:async';
import 'dart:convert';
import 'package:configs/configs.dart';
import 'package:data/src/keys/app_key.dart';
import 'package:data/src/local/app_shared_pref.dart';
import 'package:data/src/raws/base_raw.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Response;
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

part 'api_provider.dart';

part 'client_request.dart';

part 'network_interceptor_wrapper.dart';

abstract class NetworkService extends GetxService {
  static Dio newDio() {
    final dio = Dio(BaseOptions(
      baseUrl: BuildConfig.apiDomain,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ));
    dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      responseBody: true,
    ));
    dio.interceptors.add(LogInterceptor(responseBody: true));

    return dio;
  }

  Future<AppResponse> request({required ClientRequest clientRequest});
}

class NetworkServiceImpl extends NetworkService {
  late final Dio _dio;

  @override
  void onInit() {
    super.onInit();
    _dio = NetworkService.newDio();
    _dio.interceptors.add(NetworkInterceptorWrapper());
  }

  @override
  Future<AppResponse> request({required ClientRequest clientRequest}) async {
    try {
      if (clientRequest is ClientRequestDownload) {
        final response =
            await _dio.download(clientRequest.url, clientRequest.path);
        final AppResponse appResponse =
            AppResponse.fromJsonDownload(response.data);
        return HttpStatus(response.statusCode).isOk
            ? appResponse
            : throw NetworkException(
                code: response.statusCode,
                message: appResponse.metadata?.message,
                errorCode: ErrorCode.networkServiceError,
              );
      }
      if (clientRequest is ClientRequestData) {
        final response = await _dio.request(
          clientRequest.url,
          data: clientRequest.body,
          options: Options(
            method: clientRequest.method.value,
            contentType: clientRequest.contentType,
            headers: {...clientRequest.headers ?? {}},
          ),
          queryParameters: clientRequest.query,
          onSendProgress: clientRequest.onSendProgress,
          onReceiveProgress: clientRequest.onReceiveProgress,
        );
        final appResponse = AppResponse.fromJson(response.data is String
            ? jsonDecode(response.data)
            : response.data);
        return HttpStatus(response.statusCode).isOk
            ? appResponse
            : throw NetworkException(
                code: response.statusCode,
                message: appResponse.metadata?.message,
                errorCode: ErrorCode.networkServiceError,
              );
      }
      return throw NetworkException(
        code: Code.code998,
        message: 'Problem handling response data',
        errorCode: ErrorCode.networkServiceError,
      );
    } on DioException catch (e) {
      MetadataRaw? meta = AppResponse.fromJson(e.response?.data).metadata;
      throw NetworkException(
        code: e.response?.statusCode,
        message: meta?.message,
        errorCode: ErrorCode.dioError,
      );
    } catch (e) {
      throw NetworkException(
        code: Code.code999,
        message: 'SomeThingsWrong: ${e.toString()}',
        errorCode: ErrorCode.networkServiceError,
      );
    }
  }
}
