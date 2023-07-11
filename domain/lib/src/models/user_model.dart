part of 'base_model.dart';

@CopyWith()
@JsonSerializable()
class UserModel extends BaseModel {
  final String maNongDanFC;
  final String userName;

  UserModel({required this.maNongDanFC, required this.userName});

  Map<String, dynamic> get toJson => _$UserModelToJson(this);
}
