part of 'base_vo.dart';

@HiveType(typeId: 1)
class TravelUserVo extends BaseVo<TravelUserModel> {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? userName;

  TravelUserVo({required this.id, required this.userName});

  factory TravelUserVo.fromJson(Map<String, dynamic>? json) {
    return TravelUserVo(
        id: json?['id'] as int? ?? -1,
        userName: json?['username'] as String? ?? '');
  }

  static List<TravelUserVo> fromJsonToList(List<dynamic> json) {
    return json.map((e) => TravelUserVo.fromJson(e)).toList();
  }

  void setObj(TravelUserVo? vo) {
    id = vo?.id;
    userName = vo?.userName;
  }

  @override
  TravelUserModel vo2Model() {
    return TravelUserModel(id: id, userName: userName);
  }
}
