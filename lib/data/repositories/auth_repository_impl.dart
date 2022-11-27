part of '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  late final NetworkService _networkService;
  late final AppSharedPref _pref;
  final AppService _appService = Get.find();

  AuthRepositoryImpl(this._networkService, this._pref);

  @override
  Future<AppResult<TokenVo>> login(
      {required String username, required String password}) async {
    final response = await _networkService.request(
      clientRequest: ClientRequest(
        url: ApiProvider.login,
        method: HTTPMethod.post,
        query: {
          'username': username,
          'password': password,
          'fcm_token':
              'dGKlJJU1lCc:APA91bGZTz25rKtcb5WobysyPQSUp0Bfp4w1hblFjgWQeGdCEZwgFmRTCTQX9vhDk2WazWcvwpOHn8MV4NyTjrgE5vFEraxP5GbAMOnqYmo6FyVGy924yS98pEYSJXBJZ_5g_56nIFuC'
        },
      ),
    );
    if (response is AppResultSuccess<AppResponse>) {
      return AppResult.success(TokenVo.fromJson((response.netData?.data)));
    }
    if (response is AppResultFailure) {
      return AppResult.failure((response as AppResultFailure).exception);
    }
    return AppResult.exceptionEmpty();
  }

  @override
  Future<void> saveToken(
      {required String token, required String refreshToken}) async {
    _pref.setValue(AppPrefKey.token, token);
    _pref.setValue(AppPrefKey.refreshToken, refreshToken);
  }

  @override
  String languageCode() {
    return _appService.localization.defaultLanguage?.languageCode ?? 'en';
  }

  @override
  void saveLanguageCode(String code) {
    _appService.localization.saveLocalization(code);
    _appService.localization.changeLocalization(code);
  }

  @override
  bool isDarkTheme() {
    return _appService.theme.themeMode == ThemeMode.dark;
  }

  @override
  void changeThemeMode(ThemeMode themeMode) {
    _appService.theme.saveTheme(themeMode == ThemeMode.dark);
    _appService.theme.changeThemeMode(themeMode);
    _appService.theme.changeTheme(
      themeMode == ThemeMode.dark
          ? AppThemeData.darkThemeData
          : AppThemeData.lightThemeData,
    );
  }
}
