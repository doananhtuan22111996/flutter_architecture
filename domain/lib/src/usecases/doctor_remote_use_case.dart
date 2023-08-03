part of 'base_use_case.dart';

abstract class DoctorRemoteUseCase {
  Future<AppListResultModel<DoctorModel>> execute(
      {Map<String, dynamic>? query});
}

class DoctorRemoteUseCaseImpl extends DoctorRemoteUseCase {
  late final AppRepository _repo;

  DoctorRemoteUseCaseImpl(this._repo);

  @override
  Future<AppListResultModel<DoctorModel>> execute(
          {Map<String, dynamic>? query}) =>
      _repo.getDoctors(query: query ?? {});
}
