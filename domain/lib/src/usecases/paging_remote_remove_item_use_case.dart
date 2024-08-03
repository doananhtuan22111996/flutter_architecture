part of 'base_use_case.dart';

class PagingRemoteRemoveItemUseCase
    extends BaseUseCase<PagingRemoveParam, void> {
  final PagingRepository _repo;

  PagingRemoteRemoveItemUseCase(this._repo);

  @override
  Future<void> execute(PagingRemoveParam request) =>
      _repo.removeItemRemote(id: request.id);
}
