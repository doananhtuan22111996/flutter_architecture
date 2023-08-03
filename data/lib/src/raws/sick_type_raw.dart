part of 'base_raw.dart';

@HiveType(typeId: 2)
@JsonSerializable()
@CopyWith()
class SickTypeRaw extends BaseRaw<SickTypeModel> {
  @HiveField(0)
  final String? sickTypeId;
  @HiveField(1)
  final String? sickTypeName;

  SickTypeRaw({required this.sickTypeId, required this.sickTypeName});

  factory SickTypeRaw.fromJson(Map<String, dynamic>? json) =>
      _$SickTypeRawFromJson(json ?? {});

  static List<SickTypeRaw> fromJsonToList(List<dynamic>? json) =>
      json?.map((e) => SickTypeRaw.fromJson(e)).toList() ?? List.empty();

  @override
  String get key => sickTypeId ?? '';

  @override
  SickTypeModel raw2Model() {
    return SickTypeModel(
        sickTypeId: sickTypeId ?? '', sickTypeName: sickTypeName ?? '');
  }
}
