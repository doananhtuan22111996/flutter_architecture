part of 'base_remote_data_source.dart';

abstract class AppNetworkRemoteDataSource {
  Future<AppListResultRaw<HospitalRaw>> getHospitals(
      {required Map<String, dynamic> query});

  Future<AppListResultRaw<DoctorRaw>> getDoctors(
      {required Map<String, dynamic> query});

  Future<AppListResultRaw<SickTypeRaw>> getSickTypes(
      {required Map<String, dynamic> query});
}

class AppNetworkRemoteDataSourceImpl extends AppNetworkRemoteDataSource {
  late final NetworkService _networkService;

  AppNetworkRemoteDataSourceImpl(this._networkService);

  Future<AppObjResultRaw<TokenRaw>> login(
      {required Map<String, dynamic> body}) async {
    try {
      final AppResponse response = await _networkService.request(
        clientRequest: ClientRequest.request(
          ApiProvider.login,
          HttpMethod.post,
          body: {...body},
        ),
      );
      return response.toRaw((data) => TokenRaw.fromJson(data));
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppListResultRaw<DoctorRaw>> getDoctors(
      {required Map<String, dynamic> query}) async {
    try {
      final AppResponse response = await _networkService.request(
        clientRequest: ClientRequest.request(
          ApiProvider.doctor,
          HttpMethod.get,
          query: {...query},
        ),
      );
      return response.toRawList((data) => DoctorRaw.fromJsonToList(data));
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppListResultRaw<HospitalRaw>> getHospitals(
      {required Map<String, dynamic> query}) async {
    try {
      final AppResponse response = await _networkService.request(
        clientRequest: ClientRequest.request(
          ApiProvider.hospital,
          HttpMethod.get,
          query: {...query},
        ),
      );
      return response.toRawList((data) => HospitalRaw.fromJsonToList(data));
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppListResultRaw<SickTypeRaw>> getSickTypes(
      {required Map<String, dynamic> query}) async {
    try {
      final AppResponse response = await _networkService.request(
        clientRequest: ClientRequest.request(
          ApiProvider.sickType,
          HttpMethod.get,
          query: {...query},
        ),
      );
      return response.toRawList((data) => SickTypeRaw.fromJsonToList(data));
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
