part of 'base_vo.dart';

@HiveType(typeId: 1)
class TokenVo extends BaseVo<TokenModel> {
  @HiveField(0)
  final String? token;
  @HiveField(1)
  final String? refreshToken;

  TokenVo({required this.token, required this.refreshToken});

  factory TokenVo.fromJson(Map<String, dynamic>? json) {
    return TokenVo(
        token: json?['access_token'] as String? ?? '',
        refreshToken: json?['refresh_token'] as String? ?? '');
  }

  @override
  TokenModel vo2Model() {
    return TokenModel(token: token);
  }
}
