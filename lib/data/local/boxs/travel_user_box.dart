part of '../app_hive_db.dart';

class TravelUserBox extends AppHiveDb<TravelUserVo> {
  @override
  Future<Box<TravelUserVo>> _openBox() async {
    Hive.registerAdapter(TravelUserVoAdapter());
    return await Hive.openBox(AppBoxKey.user);
  }

  @override
  void writeBox(TravelUserVo obj) async {
    final index = await getBoxIndex(obj);
    if (index == -1) {
      box.add(obj);
    } else {
      final user = await getBoxAt(index);
      user?.setObj(obj);
      user?.save();
    }
  }

  @override
  Future<TravelUserVo?> getBoxAt(int position) async {
    return box.values.toList()[position];
  }

  @override
  Future<List<TravelUserVo>> getBoxAll() async {
    return box.values.toList();
  }

  @override
  Future<int> getBoxIndex(TravelUserVo obj) async {
    final vo = box.values.toList().firstWhereOrNull((e) => e.id == obj.id);
    return vo != null ? box.values.toList().indexOf(vo) : -1;
  }
}
