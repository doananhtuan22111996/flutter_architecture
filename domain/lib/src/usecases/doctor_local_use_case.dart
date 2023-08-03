part of 'base_use_case.dart';

abstract class DoctorLocalUseCase {
  Future<AppListResultModel<DoctorModel>> execute();
}

class DoctorLocalUseCaseImpl extends DoctorLocalUseCase {
  late final AppRepository _repo;

  DoctorLocalUseCaseImpl(this._repo);

  @override
  Future<AppListResultModel<DoctorModel>> execute() => _repo.getLocalDoctors();
}
