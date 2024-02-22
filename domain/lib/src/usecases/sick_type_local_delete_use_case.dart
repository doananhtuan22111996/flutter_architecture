part of 'base_use_case.dart';

abstract class SickTypeLocalDeleteUseCase {
  Future<void> execute();
}

class SickTypeLocalDeleteUseCaseImpl extends SickTypeLocalDeleteUseCase {
  late final AppFeatureRepository _repo;

  SickTypeLocalDeleteUseCaseImpl(this._repo);

  @override
  Future<void> execute() => _repo.removeSickTypes();
}
