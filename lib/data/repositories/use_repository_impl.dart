part of '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  late final NetworkService _networkService;
  late final AppHiveDb<TravelUserVo> _db;

  UserRepositoryImpl(this._networkService, this._db);

  @override
  Future<AppResult<List<TravelUserVo>>> users() async {
    final response = await _networkService.request(
      clientRequest: ClientRequest(
        url: ApiProvider.travelUser,
        method: HTTPMethod.get,
        query: {
          'page': 1.toString(),
          'current_per_page': 25.toString(),
        },
      ),
    );
    return response is AppResultSuccess<AppResponse>
        ? AppResult.success(TravelUserVo.fromJsonToList(response.netData?.data))
        : AppResult.failure((response as AppResultFailure).exception);
  }

  @override
  Future<List<TravelUserVo>> dbUsers() async {
    return await _db.getBoxAll();
  }

  @override
  Future<void> saveUsers(List<TravelUserVo> users) async {
    for (var element in users) {
      _db.writeBox(element);
    }
  }
}
