import 'package:data/src/raws/base_raw.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class AppHiveDb extends GetxService {
  @override
  void onInit() async {
    super.onInit();
    Hive.registerAdapter(UserRawAdapter());
  }
}
