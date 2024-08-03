part of 'base_raw.dart';

@JsonSerializable()
@CopyWith()
class TokenRaw extends BaseRaw<TokenModel> {
  final String token;
  final String refreshToken;

  TokenRaw({
    required this.token,
    required this.refreshToken,
  });

  factory TokenRaw.fromJson(Map<String, dynamic>? json) =>
      _$TokenRawFromJson(json ?? {});

  @override
  TokenModel raw2Model() {
    return TokenModel(
      token: token,
      refreshToken: refreshToken,
    );
  }

  @override
  String get key => token;
}
