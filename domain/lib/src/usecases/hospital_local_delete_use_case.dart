part of 'base_use_case.dart';

abstract class HospitalLocalDeleteUseCase {
  Future<void> execute();
}

class HospitalLocalDeleteUseCaseImpl extends HospitalLocalDeleteUseCase {
  late final AppFeatureRepository _repo;

  HospitalLocalDeleteUseCaseImpl(this._repo);

  @override
  Future<void> execute() => _repo.removeHospitals();
}
