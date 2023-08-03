import 'package:data/src/local/app_hive_db.dart';
import 'package:data/src/local/dao/base_dao.dart';
import 'package:domain/domain.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'local/app_shared_pref.dart';
import 'network/network_service.dart';
import 'repositories/app_repository_impl.dart';
import 'sources/local/base_local_data_source.dart';
import 'sources/remote/base_remote_data_source.dart';

class DataProvider {
  static Future<void> inject() async {
    final sharePref = Get.put<AppSharedPref>(AppSharedPrefImpl());
    await sharePref.onInit();
    Get.put<NetworkService>(NetworkServiceImpl());
    Get.put<AppHiveDb>(AppHiveDb());

    await _DataSourceProvider.inject();

    _RepoProvider.inject();
  }
}

class _DataSourceProvider {
  static Future<void> inject() async {
    final hospitalDao = HospitalDao.instance;
    hospitalDao.setBox(await Hive.openBox(hospitalDao.boxName));
    final doctorDao = DoctorDao.instance;
    doctorDao.setBox(await Hive.openBox(doctorDao.boxName));
    final sickTypeDao = SickTypeDao.instance;
    sickTypeDao.setBox(await Hive.openBox(sickTypeDao.boxName));

    Get.lazyPut<AppNetworkRemoteDataSource>(
      () => AppNetworkRemoteDataSourceImpl(Get.find()),
    );

    Get.lazyPut<AppLocalDataSource>(
      () => AppLocalDataSourceImpl(hospitalDao, doctorDao, sickTypeDao),
    );
  }
}

class _RepoProvider {
  static void inject() {
    Get.lazyPut<AppRepository>(
      () => AppRepositoryImpl(Get.find(), Get.find()),
    );
  }
}
