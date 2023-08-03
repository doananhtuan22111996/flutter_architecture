part of 'base_raw.dart';

@HiveType(typeId: 1)
@JsonSerializable()
@CopyWith()
class DoctorRaw extends BaseRaw<DoctorModel> {
  @HiveField(0)
  final String? doctorId;
  @HiveField(1)
  final String? doctorName;

  DoctorRaw({required this.doctorId, required this.doctorName});

  factory DoctorRaw.fromJson(Map<String, dynamic>? json) =>
      _$DoctorRawFromJson(json ?? {});

  static List<DoctorRaw> fromJsonToList(List<dynamic>? json) =>
      json?.map((e) => DoctorRaw.fromJson(e)).toList() ?? List.empty();

  @override
  String get key => doctorId ?? '';

  @override
  DoctorModel raw2Model() {
    return DoctorModel(doctorId: doctorId ?? '', doctorName: doctorName ?? '');
  }
}
