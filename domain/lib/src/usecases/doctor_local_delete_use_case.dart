part of 'base_use_case.dart';

abstract class DoctorLocalDeleteUseCase {
  Future<void> execute();
}

class DoctorLocalDeleteUseCaseImpl extends DoctorLocalDeleteUseCase {
  late final AppFeatureRepository _repo;

  DoctorLocalDeleteUseCaseImpl(this._repo);

  @override
  Future<void> execute() => _repo.removeDoctors();
}
