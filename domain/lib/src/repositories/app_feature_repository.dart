part of 'base_repository.dart';

abstract class AppFeatureRepository {
  // Feature Repositories
  Future<AppListResultModel<HospitalModel>> getHospitals(
      {required Map<String, dynamic> query});

  Future<AppListResultModel<DoctorModel>> getDoctors(
      {required Map<String, dynamic> query});

  Future<AppListResultModel<SickTypeModel>> getSickTypes(
      {required Map<String, dynamic> query});

  Future<AppListResultModel<HospitalModel>> getLocalHospitals();

  Future<AppListResultModel<DoctorModel>> getLocalDoctors();

  Future<AppListResultModel<SickTypeModel>> getLocalSickType();

  Future<void> removeHospitals();

  Future<void> removeHospitalAt({required String id});

  Future<void> removeDoctors();

  Future<void> removeSickTypes();
}
