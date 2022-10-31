class Metadata {
  final bool status;
  final String? errorCode;
  final String? message;

  Metadata({
    this.status = false,
    this.errorCode,
    this.message,
  });

  factory Metadata.fromJson(Map<String, dynamic>? json) => Metadata(
        status: json?["status"] ?? false,
        errorCode: json?["errorCode"] ?? '',
        message: json?["message"] ?? '',
      );
}

class AppResponse {
  final Metadata? meta;
  final dynamic data;
  final int page;
  final int limit;
  final bool hasMore;
  final int total;

  AppResponse({
    this.meta,
    this.data,
    this.page = 1,
    this.total = 0,
    this.hasMore = false,
    this.limit = 25,
  });

  factory AppResponse.fromJson(Map<String, dynamic>? json) {
    return AppResponse(
        meta: Metadata.fromJson(json?['meta']), data: json?['data']);
  }

  static AppResponse fromJsonToList(Map<String, dynamic>? json) {
    return AppResponse(
        meta: Metadata.fromJson(json?['meta']),
        data: json?['data']['items'] ?? List.empty(),
        page: json?['data']['page'] ?? 0,
        limit: json?['data']['limit'] ?? 25,
        hasMore: json?['data']['hasMore'] ?? false,
        total: json?['data']['total'] ?? 0);
  }
}
