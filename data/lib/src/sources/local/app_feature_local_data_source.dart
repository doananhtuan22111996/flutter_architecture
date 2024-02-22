part of 'base_local_data_source.dart';

abstract class AppFeatureLocalDataSource {
  Future<AppListResultRaw<HospitalRaw>> getHospitals();

  Future<AppListResultRaw<DoctorRaw>> getDoctors();

  Future<AppListResultRaw<SickTypeRaw>> getSickTypes();

  Future<void> removeHospitals();

  Future<void> removeHospitalAt({required String id});

  Future<void> removeDoctors();

  Future<void> removeSickTypes();

  Future<void> insertHospitals(List<HospitalRaw> hospitals);

  Future<void> insertDoctors(List<DoctorRaw> doctors);

  Future<void> insertSickTypes(List<SickTypeRaw> sickTypes);
}

class AppFeatureLocalDataSourceImpl extends AppFeatureLocalDataSource {
  late final HospitalDao _hospitalDao;
  late final DoctorDao _doctorDao;
  late final SickTypeDao _sickTypeDao;

  AppFeatureLocalDataSourceImpl(
      this._hospitalDao, this._doctorDao, this._sickTypeDao);

  @override
  Future<AppListResultRaw<DoctorRaw>> getDoctors() {
    try {
      final result = AppListResultRaw<DoctorRaw>(
          netData: _doctorDao.values,
          hasMore: false,
          total: _doctorDao.values.length);
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
  Future<AppListResultRaw<HospitalRaw>> getHospitals() {
    try {
      final result = AppListResultRaw<HospitalRaw>(
          netData: _hospitalDao.values,
          hasMore: false,
          total: _hospitalDao.values.length);
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
  Future<AppListResultRaw<SickTypeRaw>> getSickTypes() {
    try {
      final result = AppListResultRaw<SickTypeRaw>(
          netData: _sickTypeDao.values,
          hasMore: false,
          total: _sickTypeDao.values.length);
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
  Future<void> insertDoctors(List<DoctorRaw> doctors) async {
    try {
      await _doctorDao.writeBoxListObj(doctors);
    } on Exception catch (e) {
      throw LocalException(
        code: Code.code999,
        message: e.toString(),
        errorCode: ErrorCode.hiveError,
      );
    }
  }

  @override
  Future<void> insertHospitals(List<HospitalRaw> hospitals) async {
    try {
      await _hospitalDao.writeBoxListObj(hospitals);
    } on Exception catch (e) {
      throw LocalException(
        code: Code.code999,
        message: e.toString(),
        errorCode: ErrorCode.hiveError,
      );
    }
  }

  @override
  Future<void> insertSickTypes(List<SickTypeRaw> sickTypes) async {
    try {
      await _sickTypeDao.writeBoxListObj(sickTypes);
    } on Exception catch (e) {
      throw LocalException(
        code: Code.code999,
        message: e.toString(),
        errorCode: ErrorCode.hiveError,
      );
    }
  }

  @override
  Future<void> removeDoctors() async {
    try {
      await _doctorDao.clear();
    } on Exception catch (e) {
      throw LocalException(
        code: Code.code999,
        message: e.toString(),
        errorCode: ErrorCode.hiveError,
      );
    }
  }

  @override
  Future<void> removeHospitals() async {
    try {
      await _hospitalDao.clear();
    } on Exception catch (e) {
      throw LocalException(
        code: Code.code999,
        message: e.toString(),
        errorCode: ErrorCode.hiveError,
      );
    }
  }

  @override
  Future<void> removeSickTypes() async {
    try {
      await _sickTypeDao.clear();
    } on Exception catch (e) {
      throw LocalException(
        code: Code.code999,
        message: e.toString(),
        errorCode: ErrorCode.hiveError,
      );
    }
  }

  @override
  Future<void> removeHospitalAt({required String id}) async {
    try {
      final index = _hospitalDao.getAt(id);
      await _hospitalDao.deleteAt(index);
    } on Exception catch (e) {
      throw LocalException(
        code: Code.code999,
        message: e.toString(),
        errorCode: ErrorCode.hiveError,
      );
    }
  }
}
