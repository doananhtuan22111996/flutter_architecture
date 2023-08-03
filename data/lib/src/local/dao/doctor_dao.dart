part of 'base_dao.dart';

class DoctorDao extends BaseDao<DoctorRaw> {
  static final DoctorDao _instance = DoctorDao();

  static DoctorDao get instance => _instance;

  @override
  String get boxName => AppBoxKey.doctor;

  @override
  @override
  void setBox(Box<DoctorRaw> box) {
    _box = box;
  }
}
