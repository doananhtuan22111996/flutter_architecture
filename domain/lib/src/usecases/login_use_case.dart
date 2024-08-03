part of 'base_use_case.dart';

class LoginUseCase
    extends BaseUseCase<LoginParam, AppObjResultModel<TokenModel>> {
  late final LoginRepository _repo;

  LoginUseCase(this._repo);

  @override
  Future<AppObjResultModel<TokenModel>> execute(LoginParam request) =>
      _repo.login();
}
