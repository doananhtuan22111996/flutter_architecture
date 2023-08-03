part of 'base_use_case.dart';

abstract class HospitalLocalUseCase {
  Future<AppListResultModel<HospitalModel>> execute();
}

class HospitalLocalUseCaseImpl extends HospitalLocalUseCase {
  late final AppRepository _repo;

  HospitalLocalUseCaseImpl(this._repo);

  @override
  Future<AppListResultModel<HospitalModel>> execute() =>
      _repo.getLocalHospitals();
}
