part of 'network_service.dart';

class ApiProvider {
  static const String login = '/login';
  static const String refreshToken = '/refreshToken';
  static const String paging = '/paging-page';
}

class Code extends HttpStatus {
  Code(super.code);

  static const int code998 = 998;
  static const int code999 = 999;
}

class ErrorCode {
  ErrorCode._();

  static const String prefError = 'pref_error';
  static const String hiveError = 'hive_error';
  static const String dioError = 'dio_error';
  static const String networkServiceError = 'network__service_error';
}
