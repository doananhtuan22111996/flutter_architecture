part of 'base_raw.dart';

@HiveType(typeId: 0)
@JsonSerializable()
@CopyWith()
class HospitalRaw extends BaseRaw<HospitalModel> {
  @HiveField(0)
  final String? hospitalId;
  @HiveField(1)
  final String? hospitalName;

  HospitalRaw({required this.hospitalId, required this.hospitalName});

  factory HospitalRaw.fromJson(Map<String, dynamic>? json) =>
      _$HospitalRawFromJson(json ?? {});

  static List<HospitalRaw> fromJsonToList(List<dynamic>? json) =>
      json?.map((e) => HospitalRaw.fromJson(e)).toList() ?? List.empty();

  @override
  String get key => hospitalId ?? '';

  @override
  HospitalModel raw2Model() {
    return HospitalModel(
        hospitalId: hospitalId ?? '', hospitalName: hospitalName ?? '');
  }
}
