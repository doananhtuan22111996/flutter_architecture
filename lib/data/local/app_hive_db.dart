import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

import '../entities/base_vo.dart';
import 'app_pref_key.dart';

part 'boxs/travel_user_box.dart';

abstract class AppHiveDb<BV extends BaseVo> extends GetxService {
  late final Box<BV> box;

  final Logger _logger = Logger(printer: PrettyPrinter());

  @override
  void onInit() async {
    box = await _openBox();
    _logger.d('Hive Db: ${(await getBoxAll()).length} - ${await getBoxAll()}');
    super.onInit();
  }

  Future<Box<BV>> _openBox();

  Future<List<BV>> getBoxAll();

  Future<BV?> getBoxAt(int position);

  Future<int> getBoxIndex(BV obj);

  void writeBox(BV obj);
}
