part of 'network_service.dart';

class ApiProvider {
  static const String login = 'v1/auth/login';
  static const String refreshToken = 'v1/auth/token/refresh';
  static const String profile = 'v1/nhanVien/thongTinCaNhan';
  static const String farmerFC = 'v1/nhanVien/quanLyNongDan/nongDanFc';
  static const String session = 'v1/auth/session';
}

class Code extends HttpStatus {
  Code(super.code);

  static const int code999 = 999;
}

class ErrorCode {
  ErrorCode._();

  static const String hiveError = 'hive_error';
  static const String dioError = 'dio_error';
  static const String networkServiceError = 'network__service_error';
}
