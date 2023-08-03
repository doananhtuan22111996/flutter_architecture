part of 'base_use_case.dart';

abstract class SickTypeRemoteUseCase {
  Future<AppListResultModel<SickTypeModel>> execute(
      {Map<String, dynamic>? query});
}

class SickTypeRemoteUseCaseImpl extends SickTypeRemoteUseCase {
  late final AppRepository _repo;

  SickTypeRemoteUseCaseImpl(this._repo);

  @override
  Future<AppListResultModel<SickTypeModel>> execute(
          {Map<String, dynamic>? query}) =>
      _repo.getSickTypes(query: query ?? {});
}
