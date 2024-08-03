import 'package:data/src/raws/base_raw.dart';
import 'package:data/src/sources/local/base_local_data_source.dart';
import 'package:data/src/sources/remote/base_remote_data_source.dart';
import 'package:domain/domain.dart';

class PagingRepositoryImpl extends PagingRepository {
  late final PagingRemoteDataSource _remoteDataSource;
  late final PagingLocalDataSource _localDataSource;

  PagingRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<AppListResultModel<UserModel>> getPagingLocal(
      {required int page, required String lang}) async {
    try {
      final AppListResultRaw<UserRaw> local = await _localDataSource.paging();
      return local.raw2Model();
    } on LocalException {
      rethrow;
    }
  }

  @override
  Future<AppListResultModel<UserModel>> getPagingRemote(
      {required int page, required String lang}) async {
    try {
      final AppListResultRaw<UserRaw> remote =
          await _remoteDataSource.paging(page: page, lang: lang);
      await _localDataSource.insertUsers(remote.netData);
      return remote.raw2Model<UserModel>();
    } on NetworkException {
      rethrow;
    } on LocalException {
      rethrow;
    }
  }

  @override
  Future<void> removeItemLocal({required int id}) =>
      _localDataSource.removeUser(id: id);

  @override
  Future<void> removeItemRemote({required int id}) =>
      _remoteDataSource.removeUser(id: id);
}
