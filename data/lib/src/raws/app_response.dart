part of 'base_raw.dart';

@CopyWith()
@JsonSerializable()
class MetadataRaw extends BaseRaw<MetadataModel> {
  final bool status;
  final String? message;
  final int? limit;
  final int? page;
  final int? total;

  MetadataRaw({
    this.status = false,
    this.message,
    this.limit,
    this.page,
    this.total,
  });

  factory MetadataRaw.fromJson(Map<String, dynamic> json) =>
      _$MetadataRawFromJson(json);

  @override
  String get key => '';

  @override
  MetadataModel raw2Model() => MetadataModel(
      status: status, message: message, limit: limit, page: page, total: total);
}

@CopyWith()
@JsonSerializable()
class AppResponse {
  final MetadataRaw? metadata;
  final dynamic data;

  AppResponse({this.metadata, this.data});

  factory AppResponse.fromJson(Map<String, dynamic>? json) =>
      _$AppResponseFromJson(json ?? {});

  factory AppResponse.fromJsonDownload(dynamic json) =>
      json is Map<String, dynamic> ? AppResponse.fromJson(json) : AppResponse();

  AppObjResultRaw<BR> toRaw<BR extends BaseRaw>(
          BR? Function(Map<String, dynamic>? data) netDataFunc) =>
      AppObjResultRaw<BR>(
          metadata: metadata ??
              MetadataRaw(
                  status: false, message: "", limit: 0, page: 0, total: 0),
          netData: netDataFunc(data));

  AppListResultRaw<BR> toRawList<BR extends BaseRaw>(
          List<BR> Function(List<dynamic> data) netDataFunc) =>
      AppListResultRaw<BR>(
        metadata: metadata ??
            MetadataRaw(
                status: false, message: "", limit: 0, page: 0, total: 0),
        netData: netDataFunc(data),
      );
}
