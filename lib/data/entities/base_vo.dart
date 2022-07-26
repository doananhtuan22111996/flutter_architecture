import 'package:hive/hive.dart';

import '../../domain/models/base_model.dart';

part 'token_vo.dart';
part 'travel_user_vo.dart';

part 'base_vo.g.dart';

abstract class BaseVo<BM extends BaseModel> extends HiveObject {
  BM vo2Model();
}
