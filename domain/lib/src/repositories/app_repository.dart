part of 'base_repository.dart';

abstract class AppRepository {
  Future<AppListResultModel<HospitalModel>> getHospitals(
      {required Map<String, dynamic> query});

  Future<AppListResultModel<DoctorModel>> getDoctors(
      {required Map<String, dynamic> query});

  Future<AppListResultModel<SickTypeModel>> getSickTypes(
      {required Map<String, dynamic> query});

  Future<AppListResultModel<HospitalModel>> getLocalHospitals();

  Future<AppListResultModel<DoctorModel>> getLocalDoctors();

  Future<AppListResultModel<SickTypeModel>> getLocalSickType();

  Future<AppObjResultModel<EmptyModel>> removeHospitals();

  Future<AppObjResultModel<EmptyModel>> removeHospitalAt({required String id});

  Future<AppObjResultModel<EmptyModel>> removeDoctors();

  Future<AppObjResultModel<EmptyModel>> removeSickTypes();
}
