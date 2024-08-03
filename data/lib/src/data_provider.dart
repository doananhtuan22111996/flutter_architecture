import 'package:data/src/local/app_hive_db.dart';
import 'package:data/src/local/dao/base_dao.dart';
import 'package:data/src/repositories/login_repository_impl.dart';
import 'package:data/src/repositories/paging_repository_impl.dart';
import 'package:data/src/sources/remote/base_remote_data_source.dart';
import 'package:domain/domain.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'local/app_shared_pref.dart';
import 'network/network_service.dart';
import 'repositories/app_repository_impl.dart';
import 'sources/local/base_local_data_source.dart';

class DataProvider {
  static Future<void> serviceInject() async {
    final sharePref =
        Get.put<AppSharedPref>(AppSharedPrefImpl(), permanent: true);
    await sharePref.onInit();
    Get.put<NetworkService>(NetworkServiceImpl(), permanent: true);
    Get.put<AppHiveDb>(AppHiveDb(), permanent: true);
  }

  static Future<void> inject() async {
    await _DataSourceProvider.inject();
    _RepoProvider.inject();
  }
}

class _DataSourceProvider {
  static Future<void> inject() async {
    final userDao = UserDao.instance;
    userDao.setBox(await Hive.openBox(userDao.boxName));

    Get.lazyPut<AppLocalDataSource>(() => AppLocalDataSourceImpl(Get.find()));

    Get.lazyPut<LoginLocalDataSource>(
        () => LoginLocalDataSourceImpl(Get.find()));
    Get.lazyPut<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(Get.find()),
    );

    Get.lazyPut<PagingLocalDataSource>(
        () => PagingLocalDataSourceImpl(userDao));
    Get.lazyPut<PagingRemoteDataSource>(
      () => PagingRemoteDataSourceImpl(Get.find()),
    );
  }
}

class _RepoProvider {
  static void inject() {
    Get.lazyPut<AppRepository>(() => AppRepositoryImpl(Get.find()));
    Get.lazyPut<LoginRepository>(
      () => LoginRepositoryImpl(Get.find(), Get.find()),
    );
    Get.lazyPut<PagingRepository>(
      () => PagingRepositoryImpl(Get.find(), Get.find()),
    );
  }
}
