part of 'base_use_case.dart';

class PagingLocalUseCase
    extends BaseUseCase<PagingParam, AppListResultModel<UserModel>> {
  final PagingRepository _repo;

  PagingLocalUseCase(this._repo);

  @override
  Future<AppListResultModel<UserModel>> execute(PagingParam request) =>
      _repo.getPagingLocal(page: request.page, lang: request.lang);
}
