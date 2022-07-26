part of 'base_model.dart';

class TravelUserModel extends BaseModel {
  int? id;
  String? userName;

  TravelUserModel({required this.id, required this.userName});

  factory TravelUserModel.fromJson(Map<String, dynamic>? json) {
    return TravelUserModel(
        id: json?['id'] as int? ?? -1,
        userName: json?['user_name'] as String? ?? '');
  }

  static List<TravelUserModel> fromJsonToList(Map<String, dynamic>? json) {
    final List<TravelUserModel> result = [];
    final data = json?['data'] as List<Map<String, dynamic>?>? ?? List.empty();
    for (var element in data) {
      result.add(TravelUserModel.fromJson(element));
    }
    return result;
  }
}
