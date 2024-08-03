part of 'base_raw.dart';

class AppListResultRaw<BR extends BaseRaw> {
  AppListResultRaw({this.metadata, required this.netData});

  final MetadataRaw? metadata;
  final List<BR> netData;

  AppListResultModel<BM> raw2Model<BM extends BaseModel>() =>
      AppListResultModel(
        netData: netData.map((e) => e.raw2Model() as BM).toList(),
        metadata: metadata?.raw2Model(),
      );
}

class AppObjResultRaw<BR extends BaseRaw> {
  AppObjResultRaw({this.metadata, required this.netData});

  final MetadataRaw? metadata;
  final BR? netData;

  AppObjResultModel<BM> raw2Model<BM extends BaseModel>() => AppObjResultModel(
      metadata: metadata?.raw2Model(), netData: netData?.raw2Model() as BM?);
}
