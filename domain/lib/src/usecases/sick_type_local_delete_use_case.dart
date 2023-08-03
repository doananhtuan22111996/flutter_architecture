part of 'base_use_case.dart';

abstract class SickTypeLocalDeleteUseCase {
  Future<AppObjResultModel<EmptyModel>> execute();
}

class SickTypeLocalDeleteUseCaseImpl extends SickTypeLocalDeleteUseCase {
  late final AppRepository _repo;

  SickTypeLocalDeleteUseCaseImpl(this._repo);

  @override
  Future<AppObjResultModel<EmptyModel>> execute() => _repo.removeSickTypes();
}
