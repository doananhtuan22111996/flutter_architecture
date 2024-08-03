part of 'base_dao.dart';

class UserDao extends BaseDao<UserRaw> {
  static final UserDao _instance = UserDao();

  static UserDao get instance => _instance;

  @override
  String get boxName => AppBoxKey.user;

  @override
  @override
  void setBox(Box<UserRaw> box) {
    _box = box;
  }
}
