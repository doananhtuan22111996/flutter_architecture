part of 'network_service.dart';

enum HttpMethod {
  get(value: 'GET'),
  post(value: 'POST'),
  delete(value: 'DELETE'),
  put(value: 'PUT'),
  patch(value: 'PATCH'),
  download(value: 'DOWNLOAD');

  final String value;

  const HttpMethod({required this.value});
}

class ClientRequest {
  String url;
  HttpMethod method;
  dynamic body;
  String? contentType;
  Map<String, String>? headers;
  Map<String, dynamic>? query;
  ProgressCallback? onSendProgress;
  ProgressCallback? onReceiveProgress;
  bool isRequestForList;

  ClientRequest({
    required this.url,
    required this.method,
    this.body,
    this.contentType,
    this.headers,
    this.query,
    this.onSendProgress,
    this.onReceiveProgress,
    this.isRequestForList = false,
  });
}
