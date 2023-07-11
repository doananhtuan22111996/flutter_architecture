import 'package:data/src/local/app_hive_db.dart';
import 'package:data/src/local/dao/base_dao.dart';
import 'package:domain/domain.dart';
import 'package:get/get.dart';

import 'local/app_shared_pref.dart';
import 'network/network_service.dart';
import 'repositories/get_user_local_repository_impl.dart';
import 'repositories/get_user_repository_impl.dart';
import 'repositories/login_repository_impl.dart';
import 'sources/local/base_local_data_source.dart';
import 'sources/remote/base_remote_data_source.dart';

class DataProvider {
  static void inject() {
    Get.put<AppSharedPref>(AppSharedPrefImpl());
    Get.put<NetworkService>(NetworkServiceImpl());
    Get.put<AppHiveDb>(AppHiveDb());

    _DataSourceProvider.inject();

    _RepoProvider.inject();
  }
}

class _DataSourceProvider {
  static void inject() {
    Get.lazyPut<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(Get.find()),
    );
    Get.lazyPut<LoginLocalDataSource>(
      () => LoginLocalDataSourceImpl(Get.find()),
    );
    Get.lazyPut<GetUserRemoteDataSource>(
      () => GetUserRemoteDataSourceImpl(Get.find()),
    );
    Get.lazyPut<GetUserLocalDataSource>(
      () => GetUserLocalDataSourceImpl(UserDao.instance),
    );
  }
}

class _RepoProvider {
  static void inject() {
    Get.lazyPut<LoginRepository>(
      () => LoginRepositoryImpl(Get.find(), Get.find()),
    );
    Get.lazyPut<GetUserRepository>(
      () => GetUserRepositoryImpl(Get.find(), Get.find()),
    );
    Get.lazyPut<GetUserLocalRepository>(
      () => GetUserLocalRepositoryImpl(Get.find()),
    );
  }
}
