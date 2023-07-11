part of 'base_local_data_source.dart';

abstract class GetUserLocalDataSource {
  Future<AppListResultRaw<UserRaw>> getUsers();

  void writeBox(List<UserRaw> users);

  void clear();
}

class GetUserLocalDataSourceImpl extends GetUserLocalDataSource {
  late final UserDao _dao;

  GetUserLocalDataSourceImpl(this._dao) {
    _dao.openBox();
  }

  @override
  Future<AppListResultRaw<UserRaw>> getUsers() {
    try {
      return Future.value(AppListResultRaw<UserRaw>(
          netData: _dao.values, hasMore: false, total: _dao.values.length));
    } on Exception catch (e) {
      throw LocalException(
        code: Code.code999,
        message: e.toString(),
        errorCode: ErrorCode.hiveError,
      );
    }
  }

  @override
  void clear() => _dao.deleteAll();

  @override
  void writeBox(List<UserRaw> users) {
    _dao.writeBoxListObj(users);
  }
}
