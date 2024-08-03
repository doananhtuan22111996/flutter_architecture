part of 'base_raw.dart';

@HiveType(typeId: 1)
@JsonSerializable()
@CopyWith()
class UserRaw extends BaseRaw<UserModel> {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;

  UserRaw({required this.id, required this.name});

  factory UserRaw.fromJson(Map<String, dynamic>? json) =>
      _$UserRawFromJson(json ?? {});

  static List<UserRaw> fromJsonToList(List<dynamic>? json) =>
      json?.map((e) => UserRaw.fromJson(e)).toList() ?? List.empty();

  @override
  String get key => id.toString();

  @override
  UserModel raw2Model() => UserModel(id: id, name: name);
}
