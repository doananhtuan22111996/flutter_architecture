part of '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  late final NetworkService _networkService;
  late final AppSharedPref _pref;
  final LocalizationService _localizationService = Get.find();
  final ThemeService _themeService = Get.find();

  AuthRepositoryImpl(this._networkService, this._pref);

  @override
  Future<AppResult<TokenVo>> login(
      {required String username, required String password}) async {
    final response = await _networkService.request(
      clientRequest: ClientRequest(
        url: ApiProvider.auth,
        method: HTTPMethod.post,
        query: {
          'username': username,
          'password': password,
          'fcm_token':
              'dGKlJJU1lCc:APA91bGZTz25rKtcb5WobysyPQSUp0Bfp4w1hblFjgWQeGdCEZwgFmRTCTQX9vhDk2WazWcvwpOHn8MV4NyTjrgE5vFEraxP5GbAMOnqYmo6FyVGy924yS98pEYSJXBJZ_5g_56nIFuC'
        },
      ),
    );
    return response is AppResultSuccess<AppResponse>
        ? AppResult.success(TokenVo.fromJson((response.netData?.data)))
        : AppResult.failure((response as AppResultFailure).exception);
  }

  @override
  Future<void> saveToken(
      {required String token, required String refreshToken}) async {
    _pref.setValue(AppPrefKey.token, token);
    _pref.setValue(AppPrefKey.refreshToken, refreshToken);
  }

  @override
  String languageCode() {
    return _localizationService.defaultLanguage?.languageCode ?? 'en';
  }

  @override
  void saveLanguageCode(String code) {
    _localizationService.saveLocalization(code);
    _localizationService.changeLocalization(code);
  }

  @override
  bool isDarkTheme() {
    return _themeService.theme == ThemeMode.dark;
  }

  @override
  void changeThemeMode(ThemeMode themeMode) {
    _themeService.saveTheme(themeMode == ThemeMode.dark);
    _themeService.changeThemeMode(themeMode);
    _themeService.changeTheme(themeMode == ThemeMode.dark
        ? AppThemeData.dartTheme
        : AppThemeData.lightTheme);
  }
}
