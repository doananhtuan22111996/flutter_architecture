part of 'base_remote_data_source.dart';

abstract class PagingRemoteDataSource {
  Future<AppListResultRaw<UserRaw>> paging(
      {required int page, required String lang});

  Future<void> removeUser({required int id});
}

class PagingRemoteDataSourceImpl extends PagingRemoteDataSource {
  late final NetworkService _networkService;

  PagingRemoteDataSourceImpl(this._networkService);

  @override
  Future<AppListResultRaw<UserRaw>> paging(
      {required int page, required String lang}) async {
    try {
      final AppResponse response = await _networkService.request(
        clientRequest: ClientRequest.request(
          ApiProvider.paging,
          HttpMethod.get,
          query: {"page": page, "lang": lang},
        ),
      );
      return response.toRawList((data) => UserRaw.fromJsonToList(data));
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> removeUser({required int id}) async {
    try {
      final AppResponse response = await _networkService.request(
        clientRequest: ClientRequest.request(
          ApiProvider.paging,
          HttpMethod.delete,
          body: {"id": 1},
        ),
      );
      return Future.value();
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
