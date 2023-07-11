part of 'base_repository.dart';

abstract class GetUserLocalRepository {
  Future<AppListResultModel<UserModel>> getUsers();
}
