part of 'base_remote_data_source.dart';

abstract class GetUserRemoteDataSource {
  Future<AppListResultRaw<UserRaw>> getUsers(
      {required Map<String, dynamic> query});
}

class GetUserRemoteDataSourceImpl extends GetUserRemoteDataSource {
  late final NetworkService _networkService;

  GetUserRemoteDataSourceImpl(this._networkService);

  @override
  Future<AppListResultRaw<UserRaw>> getUsers(
      {required Map<String, dynamic> query}) async {
    try {
      final AppResponse response = await _networkService.request(
        clientRequest: ClientRequest(
          url: ApiProvider.farmerFC,
          method: HttpMethod.get,
          query: {...query},
          isRequestForList: true,
        ),
      );
      return response
          .toRawList((data) => UserRaw.fromJsonToList(response.data));
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
