part of 'base_raw.dart';

@HiveType(typeId: 0)
@JsonSerializable()
@CopyWith()
class UserRaw extends BaseRaw<UserModel> {
  @HiveField(0)
  final String maNongDanFC;
  @HiveField(1)
  final String ten;

  UserRaw({
    required this.maNongDanFC,
    required this.ten,
  });

  factory UserRaw.fromJson(Map<String, dynamic> json) =>
      _$UserRawFromJson(json);

  static List<UserRaw> fromJsonToList(List<dynamic> json) {
    return json.map((e) => UserRaw.fromJson(e)).toList();
  }

  @override
  String get key => maNongDanFC;

  @override
  UserModel raw2Model() {
    return UserModel(maNongDanFC: maNongDanFC, userName: ten);
  }
}
