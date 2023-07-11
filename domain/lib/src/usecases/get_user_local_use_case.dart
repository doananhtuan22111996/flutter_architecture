part of 'base_use_case.dart';

abstract class GetUserLocalUseCase {
  Future<AppListResultModel<UserModel>> execute();
}

class GetUserLocalUseCaseImpl extends GetUserLocalUseCase {
  late final GetUserLocalRepository _repo;

  GetUserLocalUseCaseImpl(this._repo);

  @override
  Future<AppListResultModel<UserModel>> execute() => _repo.getUsers();
}
