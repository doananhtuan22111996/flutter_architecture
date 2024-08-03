part of 'base_local_data_source.dart';

abstract class PagingLocalDataSource {
  Future<AppListResultRaw<UserRaw>> paging();

  Future<void> removeUser({required int id});

  Future<void> insertUsers(List<UserRaw> users);
}

class PagingLocalDataSourceImpl extends PagingLocalDataSource {
  late final UserDao _userDao;

  PagingLocalDataSourceImpl(this._userDao);

  @override
  Future<void> insertUsers(List<UserRaw> users) async {
    try {
      await _userDao.writeBoxListObj(users);
    } on Exception catch (e) {
      throw LocalException(
        code: Code.code999,
        message: e.toString(),
        errorCode: ErrorCode.hiveError,
      );
    }
  }

  @override
  Future<AppListResultRaw<UserRaw>> paging() {
    try {
      final result = AppListResultRaw<UserRaw>(
        netData: _userDao.values,
      );
      return Future.value(result);
    } on Exception catch (e) {
      throw LocalException(
        code: Code.code999,
        message: e.toString(),
        errorCode: ErrorCode.hiveError,
      );
    }
  }

  @override
  Future<void> removeUser({required int id}) async {
    try {
      final index = _userDao.getAt(id.toString());
      await _userDao.deleteAt(index);
    } on Exception catch (e) {
      throw LocalException(
        code: Code.code999,
        message: e.toString(),
        errorCode: ErrorCode.hiveError,
      );
    }
  }
}
