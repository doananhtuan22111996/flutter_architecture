part of 'base_raw.dart';

class AppListResultRaw<BR extends BaseRaw> {
  AppListResultRaw(
      {required this.netData, this.hasMore = false, this.total = 0});

  final List<BR>? netData;
  final bool hasMore;
  final int total;

  AppListResultModel<BM> raw2Model<BM extends BaseModel>() =>
      AppListResultModel(
        netData: netData?.map((e) => e.raw2Model() as BM).toList(),
        hasMore: hasMore,
        total: total,
      );
}

class AppObjResultRaw<BR extends BaseRaw> {
  AppObjResultRaw({required this.netData});

  final BR? netData;

  AppObjResultModel<BM> raw2Model<BM extends BaseModel>() =>
      AppObjResultModel(netData: netData?.raw2Model() as BM?);
}
