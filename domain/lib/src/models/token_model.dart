part of 'base_model.dart';

@CopyWith()
class TokenModel extends BaseModel {
  final String? token;
  final String? refreshToken;

  TokenModel({
    required this.token,
    required this.refreshToken,
  });
}
