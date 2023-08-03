part of 'base_use_case.dart';

abstract class SickTypeLocalUseCase {
  Future<AppListResultModel<SickTypeModel>> execute();
}

class SickTypeLocalUseCaseImpl extends SickTypeLocalUseCase {
  late final AppRepository _repo;

  SickTypeLocalUseCaseImpl(this._repo);

  @override
  Future<AppListResultModel<SickTypeModel>> execute() =>
      _repo.getLocalSickType();
}
