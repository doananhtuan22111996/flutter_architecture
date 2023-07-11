import 'package:domain/domain.dart';

import '../raws/base_raw.dart';
import '../sources/local/base_local_data_source.dart';

class GetUserLocalRepositoryImpl implements GetUserLocalRepository {
  late final GetUserLocalDataSource _localDataSource;

  GetUserLocalRepositoryImpl(this._localDataSource);

  @override
  Future<AppListResultModel<UserModel>> getUsers() async {
    try {
      final AppListResultRaw<UserRaw> local =
          await _localDataSource.getUsers();
      return local.raw2Model();
    } on LocalException {
      rethrow;
    }
  }
}
