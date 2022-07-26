import '../../data/entities/base_vo.dart';
import '../../data/network/nets/app_result.dart';
import '../models/base_model.dart';
import '../repositories/user_repository.dart';

part '../../data/usecases/user_use_case_impl.dart';

abstract class UserUseCase {
  Future<AppResult<List<TravelUserModel>>> users();
  Future<List<TravelUserModel>> dbUsers();
}
