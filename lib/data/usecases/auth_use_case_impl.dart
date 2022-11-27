part of '../../domain/usecases/auth_use_case.dart';

class AuthUseCaseImpl implements AuthUseCase {
  late final AuthRepository _repo;

  AuthUseCaseImpl(this._repo);

  @override
  Future<AppResult<TokenModel>> login(LoginParam? params) async {
    final AppResult<TokenVo> resultVo = await _repo.login(
        username: params?.userName ?? '', password: params?.password ?? '');
    if (resultVo is AppResultSuccess<TokenVo>) {
      await _repo.saveToken(
          token: resultVo.netData?.token ?? '',
          refreshToken: resultVo.netData?.refreshToken ?? '');
      return AppResult.success(resultVo.netData?.vo2Model());
    }
    if (resultVo is AppResultFailure) {
      return AppResult.failure((resultVo as AppResultFailure).exception);
    }
    return AppResult.exceptionEmpty();
  }

  @override
  String languageCode() {
    return _repo.languageCode();
  }

  @override
  void saveLanguageCode(String code) {
    _repo.saveLanguageCode(code);
  }

  @override
  bool isDarkTheme() {
    return _repo.isDarkTheme();
  }

  @override
  void changeThemeMode(ThemeMode themeMode) {
    _repo.changeThemeMode(themeMode);
  }
}
