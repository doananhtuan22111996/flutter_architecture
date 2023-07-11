part of 'base_repository.dart';

abstract class DeleteUserRepository {
  Future<AppObjResultModel<EmptyModel>> clear();
}
