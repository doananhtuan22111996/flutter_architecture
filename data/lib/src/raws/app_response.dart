part of 'base_raw.dart';

class Metadata {
  final bool status;
  final String? errorCode;
  final String? message;

  Metadata({
    this.status = false,
    this.errorCode,
    this.message,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        status: json["status"] ?? false,
        errorCode: json["errorCode"] ?? '',
        message: json["message"] ?? '',
      );
}

class AppResponse {
  late final Metadata? meta;
  final dynamic data;
  final int? page;
  final int? limit;
  final int? total;
  final bool? hasMore;

  AppResponse({
    this.meta,
    this.data,
    this.page,
    this.total,
    this.limit,
    this.hasMore,
  });

  factory AppResponse.fromJson(Map<String, dynamic>? json) {
    final Metadata meta = Metadata.fromJson(json?['meta']);
    final Map<String, dynamic>? data = json?['data'];
    final isPagination = data?.containsKey('items') == true;
    return AppResponse(
      meta: meta,
      data: isPagination ? (data?['items']) : data,
      page: isPagination ? (data?['page']) : null,
      limit: isPagination ? (data?['limit']) : null,
      hasMore: isPagination ? (data?['hasMore']) : null,
      total: isPagination ? (data?['total']) : null,
    );
  }

  factory AppResponse.fromJsonDownload(dynamic json) =>
      json is Map<String, dynamic> ? AppResponse.fromJson(json) : AppResponse();

  AppObjResultRaw<BR> toRaw<BR extends BaseRaw>(
          BR? Function(dynamic data) netDataFunc) =>
      AppObjResultRaw<BR>(netData: netDataFunc(data));

  AppListResultRaw<BR> toRawList<BR extends BaseRaw>(
          List<BR> Function(dynamic data) netDataFunc) =>
      AppListResultRaw<BR>(
        netData: netDataFunc(data),
        hasMore: hasMore ?? false,
        total: total ?? 0,
      );
}
