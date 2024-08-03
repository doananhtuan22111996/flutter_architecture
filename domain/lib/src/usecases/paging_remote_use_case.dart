part of 'base_use_case.dart';

class PagingRemoteUseCase
    extends BaseUseCase<PagingParam, AppListResultModel<UserModel>> {
  final PagingRepository _repo;

  PagingRemoteUseCase(this._repo);

  @override
  Future<AppListResultModel<UserModel>> execute(PagingParam request) =>
      _repo.getPagingRemote(page: request.page, lang: request.lang);
}
