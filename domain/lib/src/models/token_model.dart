part of 'base_model.dart';

@CopyWith()
@JsonSerializable()
class TokenModel extends BaseModel {
  final String? token;
  final String? refreshToken;

  TokenModel({
    required this.token,
    required this.refreshToken,
  });

  Map<String, dynamic> get toJson => _$TokenModelToJson(this);
}
