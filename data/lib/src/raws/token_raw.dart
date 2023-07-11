part of 'base_raw.dart';

@JsonSerializable()
@CopyWith()
class TokenRaw extends BaseRaw<TokenModel> {
  final String accessToken;
  final String refreshToken;

  TokenRaw({
    required this.accessToken,
    required this.refreshToken,
  });

  factory TokenRaw.fromJson(Map<String, dynamic> json) =>
      _$TokenRawFromJson(json);

  @override
  TokenModel raw2Model() {
    return TokenModel(
      token: accessToken,
      refreshToken: refreshToken,
    );
  }

  @override
  String get key => accessToken;
}
