part of 'base_use_case.dart';

abstract class HospitalRemoteUseCase {
  Future<AppListResultModel<HospitalModel>> execute(
      {Map<String, dynamic>? query});
}

class HospitalRemoteUseCaseImpl extends HospitalRemoteUseCase {
  late final AppRepository _repo;

  HospitalRemoteUseCaseImpl(this._repo);

  @override
  Future<AppListResultModel<HospitalModel>> execute(
          {Map<String, dynamic>? query}) =>
      _repo.getHospitals(query: query ?? {});
}
