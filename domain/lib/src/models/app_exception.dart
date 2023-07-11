part of 'base_model.dart';

abstract class AppException implements Exception {
  final int? code; // HTTP Status
  final String? message;
  final String? errorCode;

  AppException({required this.code, required this.message, this.errorCode});

  @override
  String toString() {
    return "[$code]: $message : $errorCode";
  }
}

class NetworkException extends AppException {
  NetworkException(
      {required super.code, required super.message, super.errorCode});
}

class LocalException extends AppException {
  LocalException(
      {required super.code, required super.message, super.errorCode});
}
