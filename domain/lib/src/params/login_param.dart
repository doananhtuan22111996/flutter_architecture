part of 'base_param.dart';

@JsonSerializable()
class LoginParam {
  final String username;
  final String password;

  LoginParam({required this.username, required this.password});

  Map<String, dynamic> get toJson => _$LoginParamToJson(this);
}
