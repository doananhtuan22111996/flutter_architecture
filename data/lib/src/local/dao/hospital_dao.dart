part of 'base_dao.dart';

class HospitalDao extends BaseDao<HospitalRaw> {
  static final HospitalDao _instance = HospitalDao();

  static HospitalDao get instance => _instance;

  @override
  String get boxName => AppBoxKey.hospital;

  @override
  @override
  void setBox(Box<HospitalRaw> box) {
    _box = box;
  }
}
