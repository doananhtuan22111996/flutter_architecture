part of 'base_use_case.dart';

abstract class GetUserUseCase {
  Future<AppListResultModel<UserModel>> execute(Map<String, dynamic> query);
}

class GetUserUseCaseImpl extends GetUserUseCase {
  late final GetUserRepository _repo;

  GetUserUseCaseImpl(this._repo);

  @override
  Future<AppListResultModel<UserModel>> execute(Map<String, dynamic> query) =>
      _repo.getUsers(query: query);
}
