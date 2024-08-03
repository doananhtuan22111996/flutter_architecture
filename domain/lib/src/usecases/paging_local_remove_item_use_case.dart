part of 'base_use_case.dart';

class PagingLocalRemoveItemUseCase
    extends BaseUseCase<PagingRemoveParam, void> {
  final PagingRepository _repo;

  PagingLocalRemoveItemUseCase(this._repo);

  @override
  Future<void> execute(PagingRemoveParam request) =>
      _repo.removeItemLocal(id: request.id);
}
