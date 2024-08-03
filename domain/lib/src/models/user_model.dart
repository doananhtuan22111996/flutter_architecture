part of 'base_model.dart';

@CopyWith()
class UserModel extends BaseModel {
  final int id;
  final String name;

  UserModel({required this.id, required this.name});
}
