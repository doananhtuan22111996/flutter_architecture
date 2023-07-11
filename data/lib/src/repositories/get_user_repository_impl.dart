import 'package:domain/domain.dart';

import '../raws/base_raw.dart';
import '../sources/local/base_local_data_source.dart';
import '../sources/remote/base_remote_data_source.dart';

class GetUserRepositoryImpl implements GetUserRepository {
  late final GetUserRemoteDataSource _remoteDataSource;
  late final GetUserLocalDataSource _localDataSource;

  GetUserRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<AppListResultModel<UserModel>> getUsers(
      {required Map<String, dynamic> query}) async {
    try {
      final AppListResultRaw<UserRaw> remote =
          await _remoteDataSource.getUsers(query: query);
      // TODO combine data
      // final AppListResultRaw<TravelUserRaw> local =
      //     await _localDataSource.getUsers(query: query);
      _localDataSource.writeBox(remote.netData ?? List.empty());
      return remote.raw2Model<UserModel>();
    } on NetworkException {
      final AppListResultRaw<UserRaw> local = await _localDataSource.getUsers();
      return local.raw2Model();
    } on LocalException {
      rethrow;
    }
  }
}
