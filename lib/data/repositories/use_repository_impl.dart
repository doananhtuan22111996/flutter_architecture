part of '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  late final NetworkService _networkService;
  late final AppHiveDb<TravelUserVo> _db;

  UserRepositoryImpl(this._networkService, this._db);

  @override
  Future<AppResult<List<TravelUserVo>>> users(int page) async {
    final response = await _networkService.request(
      clientRequest: ClientRequest(
          url: ApiProvider.travelUser,
          method: HTTPMethod.get,
          query: {
            'page': page.toString(),
            'current_per_page': 25.toString(),
          },
          isRequestForList: true),
    );
    if (response is AppResultSuccess<AppResponse>) {
      return AppResult.success(
          TravelUserVo.fromJsonToList(response.netData?.data));
    }
    if (response is AppResultFailure) {
      return AppResult.failure((response as AppResultFailure).exception);
    }
    return AppResult.exceptionEmpty();
  }

  @override
  Future<List<TravelUserVo>> dbUsers() async {
    return _db.getBoxAll();
  }

  @override
  Future<void> saveUsers(List<TravelUserVo> users) async {
    for (var element in users) {
      _db.writeBox(element);
    }
  }
}
