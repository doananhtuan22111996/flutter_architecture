part of 'base_use_case.dart';

abstract class LoginUseCase {
  Future<AppObjResultModel<TokenModel>> execute({required LoginParam param});
}

class LoginUseCaseImpl implements LoginUseCase {
  late final LoginRepository _repo;

  LoginUseCaseImpl(this._repo);

  @override
  Future<AppObjResultModel<TokenModel>> execute({required LoginParam param}) =>
      _repo.login(body: param.toJson);
}
