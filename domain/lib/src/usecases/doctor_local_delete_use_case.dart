part of 'base_use_case.dart';

abstract class DoctorLocalDeleteUseCase {
  Future<AppObjResultModel<EmptyModel>> execute();
}

class DoctorLocalDeleteUseCaseImpl extends DoctorLocalDeleteUseCase {
  late final AppRepository _repo;

  DoctorLocalDeleteUseCaseImpl(this._repo);

  @override
  Future<AppObjResultModel<EmptyModel>> execute() => _repo.removeDoctors();
}
