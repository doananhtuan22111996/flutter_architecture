part of 'network_service.dart';

class ApiProvider {
  static const String login = 'v1/auth/login';
  static const String refreshToken = 'v1/auth/token/refresh';
  static const String hospital = '/v1/master/hospital';
  static const String doctor = '/v1/master/doctor';
  static const String sickType = '/v1/master/sickType';
}

class Code extends HttpStatus {
  Code(super.code);

  static const int code998 = 998;
  static const int code999 = 999;
}

class ErrorCode {
  ErrorCode._();

  static const String hiveError = 'hive_error';
  static const String dioError = 'dio_error';
  static const String networkServiceError = 'network__service_error';
}
