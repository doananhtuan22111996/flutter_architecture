part of 'base_repository.dart';

abstract class LoginRepository {
  Future<AppObjResultModel<TokenModel>> login();
}
