class Metadata {
  int? totalCount;
  int? totalPages;
  int? nextPage;
  int? prevPages;
  int? currentPage;
  String? currentPerPage;

  Metadata(
      {this.totalCount,
      this.totalPages,
      this.nextPage,
      this.prevPages,
      this.currentPage,
      this.currentPerPage});

  factory Metadata.fromJson(Map<String, dynamic>? json) => Metadata(
        totalCount: json?["total_count"] ?? -1,
        totalPages: json?["total_pages"] ?? -1,
        nextPage: json?["next_page"] ?? -1,
        prevPages: json?["prev_pages"] ?? -1,
        currentPage: json?["current_page"] ?? -1,
        currentPerPage: json?["current_per_page"] ?? '',
      );
}

class AppResponse {
  int? code;
  String? message;
  bool? status;
  Metadata? metadata;
  dynamic data;

  AppResponse({this.code, this.message, this.status, this.metadata, this.data});

  factory AppResponse.fromJson(Map<String, dynamic>? json) {
    return AppResponse(
        code: json?['code'] ?? -1,
        message: json?['message'] ?? '',
        status: json?['status'] ?? false,
        metadata: Metadata.fromJson(json?['metadata']),
        data: json?['data']);
  }
}
