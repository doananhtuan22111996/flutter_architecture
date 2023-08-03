part of 'base_use_case.dart';

abstract class HospitalLocalDeleteAtUseCase {
  Future<AppObjResultModel<EmptyModel>> execute({required String id});
}

class HospitalLocalDeleteAtUseCaseImpl extends HospitalLocalDeleteAtUseCase {
  late final AppRepository _repo;

  HospitalLocalDeleteAtUseCaseImpl(this._repo);

  @override
  Future<AppObjResultModel<EmptyModel>> execute({required String id}) =>
      _repo.removeHospitalAt(id: id);
}
