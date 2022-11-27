part of 'network_service.dart';

enum HTTPMethod { get, post, delete, put, patch }

extension HTTPMethodString on HTTPMethod {
  String get value {
    switch (this) {
      case HTTPMethod.get:
        return "get";
      case HTTPMethod.post:
        return "post";
      case HTTPMethod.delete:
        return "delete";
      case HTTPMethod.patch:
        return "patch";
      case HTTPMethod.put:
        return "put";
    }
  }
}

class ClientRequest {
  String url;
  HTTPMethod method;
  dynamic body;
  String? contentType;
  Map<String, String>? headers;
  Map<String, dynamic>? query;
  Progress? uploadProgress;
  bool isRequestForList;

  ClientRequest({
    required this.url,
    required this.method,
    this.body,
    this.contentType,
    this.headers,
    this.query,
    this.uploadProgress,
    this.isRequestForList = false,
  });
}
