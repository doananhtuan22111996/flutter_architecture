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

abstract class ClientRequest {
  final String url;
  final Map<String, dynamic>? query;
  final ProgressCallback? onSendProgress;
  final ProgressCallback? onReceiveProgress;

  ClientRequest({
    required this.url,
    this.query,
    this.onReceiveProgress,
    this.onSendProgress,
  });

  factory ClientRequest.request(
    String url,
    HttpMethod method, {
    dynamic body,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    String? contentType,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) =>
      ClientRequestData(
        url: url,
        method: method,
        body: body,
        query: query,
        headers: headers,
        contentType: contentType,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

  factory ClientRequest.download(
    String url,
    String path, {
    Map<String, dynamic>? query,
    ProgressCallback? onReceiveProgress,
  }) =>
      ClientRequestDownload(
        url: url,
        path: path,
        query: query,
        onReceiveProgress: onReceiveProgress,
      );
}

class ClientRequestData extends ClientRequest {
  final HttpMethod method;
  final dynamic body;
  final Map<String, String>? headers;
  final String? contentType;

  ClientRequestData({
    required super.url,
    required this.method,
    this.body,
    super.query,
    this.headers,
    this.contentType,
    super.onReceiveProgress,
    super.onSendProgress,
  });
}

class ClientRequestDownload extends ClientRequest {
  final String path;

  ClientRequestDownload({
    required super.url,
    required this.path,
    super.query,
    super.onReceiveProgress,
  });
}
