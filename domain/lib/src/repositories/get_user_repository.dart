part of 'base_repository.dart';

abstract class GetUserRepository {
  Future<AppListResultModel<UserModel>> getUsers(
      {required Map<String, dynamic> query});
}
