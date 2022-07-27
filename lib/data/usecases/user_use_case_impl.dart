part of '../../domain/usecases/user_use_case.dart';

class UserUseCaseImpl extends UserUseCase {
  late final UserRepository _repo;

  UserUseCaseImpl(this._repo);

  @override
  Future<AppResult<List<TravelUserModel>>> users(int page) async {
    final response = await _repo.users(page);
    if (response is AppResultSuccess<List<TravelUserVo>>) {
      await _repo.saveUsers(response.netData ?? []);
      return AppResult.success(
          response.netData?.map((e) => e.vo2Model()).toList());
    } else {
      return AppResult.failure((response as AppResultFailure).exception);
    }
  }

  @override
  Future<List<TravelUserModel>> dbUsers() async {
    final travelUsers = await _repo.dbUsers();
    return travelUsers.map((e) => e.vo2Model()).toList();
  }
}
