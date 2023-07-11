part of 'base_model.dart';

class AppListResultModel<BM extends BaseModel> {
  AppListResultModel(
      {required this.netData, this.hasMore = false, this.total = 0});

  final List<BM>? netData;
  final bool hasMore;
  final int total;
}

class AppObjResultModel<BM extends BaseModel> {
  AppObjResultModel({required this.netData});

  final BM? netData;
}
