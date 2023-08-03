import 'package:data/src/raws/base_raw.dart';
import 'package:data/src/sources/local/base_local_data_source.dart';
import 'package:data/src/sources/remote/base_remote_data_source.dart';
import 'package:domain/domain.dart';

class AppRepositoryImpl extends AppRepository {
  late final AppNetworkRemoteDataSource _remoteDataSource;
  late final AppLocalDataSource _localDataSource;

  AppRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<AppListResultModel<DoctorModel>> getDoctors(
      {required Map<String, dynamic> query}) async {
    try {
      final AppListResultRaw<DoctorRaw> remote =
          await _remoteDataSource.getDoctors(query: query);
      await _localDataSource.insertDoctors(remote.netData ?? List.empty());
      return remote.raw2Model<DoctorModel>();
    } on NetworkException {
      rethrow;
    } on LocalException {
      rethrow;
    }
  }

  @override
  Future<AppListResultModel<HospitalModel>> getHospitals(
      {required Map<String, dynamic> query}) async {
    try {
      final AppListResultRaw<HospitalRaw> remote =
          await _remoteDataSource.getHospitals(query: query);
      await _localDataSource.insertHospitals(remote.netData ?? List.empty());
      return remote.raw2Model<HospitalModel>();
    } on NetworkException {
      rethrow;
    } on LocalException {
      rethrow;
    }
  }

  @override
  Future<AppListResultModel<SickTypeModel>> getSickTypes(
      {required Map<String, dynamic> query}) async {
    try {
      final AppListResultRaw<SickTypeRaw> remote =
          await _remoteDataSource.getSickTypes(query: query);
      await _localDataSource.insertSickTypes(remote.netData ?? List.empty());
      return remote.raw2Model<SickTypeModel>();
    } on NetworkException {
      rethrow;
    } on LocalException {
      rethrow;
    }
  }

  @override
  Future<AppListResultModel<DoctorModel>> getLocalDoctors() async {
    try {
      final AppListResultRaw<DoctorRaw> local =
          await _localDataSource.getDoctors();
      return local.raw2Model();
    } on LocalException {
      rethrow;
    }
  }

  @override
  Future<AppListResultModel<HospitalModel>> getLocalHospitals() async {
    try {
      final AppListResultRaw<HospitalRaw> local =
          await _localDataSource.getHospitals();
      return local.raw2Model();
    } on LocalException {
      rethrow;
    }
  }

  @override
  Future<AppListResultModel<SickTypeModel>> getLocalSickType() async {
    try {
      final AppListResultRaw<SickTypeRaw> local =
          await _localDataSource.getSickTypes();
      return local.raw2Model();
    } on LocalException {
      rethrow;
    }
  }

  @override
  Future<AppObjResultModel<EmptyModel>> removeDoctors() async {
    try {
      final AppObjResultRaw<EmptyRaw> local =
          await _localDataSource.removeDoctors();
      return local.raw2Model();
    } on LocalException {
      rethrow;
    }
  }

  @override
  Future<AppObjResultModel<EmptyModel>> removeHospitals() async {
    try {
      final AppObjResultRaw<EmptyRaw> local =
          await _localDataSource.removeHospitals();
      return local.raw2Model();
    } on LocalException {
      rethrow;
    }
  }

  @override
  Future<AppObjResultModel<EmptyModel>> removeSickTypes() async {
    try {
      final AppObjResultRaw<EmptyRaw> local =
          await _localDataSource.removeSickTypes();
      return local.raw2Model();
    } on LocalException {
      rethrow;
    }
  }

  @override
  Future<AppObjResultModel<EmptyModel>> removeHospitalAt(
      {required String id}) async {
    try {
      final AppObjResultRaw<EmptyRaw> local =
          await _localDataSource.removeHospitalAt(id: id);
      return local.raw2Model();
    } on LocalException {
      rethrow;
    }
  }
}
