part of 'base_use_case.dart';

abstract class HospitalLocalDeleteUseCase {
  Future<AppObjResultModel<EmptyModel>> execute();
}

class HospitalLocalDeleteUseCaseImpl extends HospitalLocalDeleteUseCase {
  late final AppRepository _repo;

  HospitalLocalDeleteUseCaseImpl(this._repo);

  @override
  Future<AppObjResultModel<EmptyModel>> execute() => _repo.removeHospitals();
}
