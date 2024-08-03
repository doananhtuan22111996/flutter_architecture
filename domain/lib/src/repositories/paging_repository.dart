part of 'base_repository.dart';

abstract class PagingRepository {
  // Feature Repositories
  Future<AppListResultModel<UserModel>> getPagingRemote(
      {required int page, required String lang});

  Future<AppListResultModel<UserModel>> getPagingLocal(
      {required int page, required String lang});

  Future<void> removeItemRemote({required int id});

  Future<void> removeItemLocal({required int id});
}
