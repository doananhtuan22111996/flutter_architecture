import 'package:data/src/keys/app_key.dart';
import 'package:data/src/raws/base_raw.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

part 'user_dao.dart';

abstract class BaseDao<BV extends BaseRaw> {
  @protected
  late final Box<BV> _box;

  @protected
  abstract final String boxName;

  void setBox(Box<BV> box);

  List<BV> get values => _box.values.toList();

  Future<void> close() => _box.close();

  Future<void> deleteAll() => _box.deleteAll(_box.keys);

  Future<void> deleteAt(int index) => _box.deleteAt(index);

  Future<void> clear() => _box.clear();

  Future<void> writeBoxObj(BV obj) =>
      getAt(obj.key) != -1 ? _box.putAt(getAt(obj.key), obj) : _box.add(obj);

  Future<void> writeBoxListObj(List<BV> bvs) {
    for (var element in bvs) {
      writeBoxObj(element);
    }
    return Future.value();
  }

  /// getAt == -1 -> Not exist yet
  /// getAt != -1 -> Existed
  int getAt(String key) {
    final objWithKey =
        _box.values.toList().firstWhereOrNull((element) => element.key == key);

    return objWithKey != null ? _box.values.toList().indexOf(objWithKey) : -1;
  }
}
