part of 'base_model.dart';

@CopyWith()
class MetadataModel extends BaseModel {
  final bool status;
  final String? message;
  final int? limit;
  final int? page;
  final int? total;

  MetadataModel({
    this.status = false,
    this.message,
    this.limit,
    this.page,
    this.total,
  });
}

@CopyWith()
class AppListResultModel<BM extends BaseModel> {
  AppListResultModel({this.metadata, required this.netData});

  final MetadataModel? metadata;
  final List<BM> netData;
}

class AppObjResultModel<BM extends BaseModel> {
  AppObjResultModel({this.metadata, required this.netData});

  final MetadataModel? metadata;
  final BM? netData;
}
