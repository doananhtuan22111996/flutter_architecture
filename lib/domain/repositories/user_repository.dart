import '../../data/entities/base_vo.dart';
import '../../data/local/app_hive_db.dart';
import '../../data/network/nets/app_response.dart';
import '../../data/network/nets/app_result.dart';
import '../../data/network/network_service.dart';

part '../../data/repositories/use_repository_impl.dart';

abstract class UserRepository {
  Future<AppResult<List<TravelUserVo>>> users(int page);

  Future<List<TravelUserVo>> dbUsers();

  Future<void> saveUsers(List<TravelUserVo> users);
}
