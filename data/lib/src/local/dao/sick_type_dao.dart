part of 'base_dao.dart';

class SickTypeDao extends BaseDao<SickTypeRaw> {
  static final SickTypeDao _instance = SickTypeDao();

  static SickTypeDao get instance => _instance;

  @override
  String get boxName => AppBoxKey.sickType;

  @override
  @override
  void setBox(Box<SickTypeRaw> box) {
    _box = box;
  }
}
