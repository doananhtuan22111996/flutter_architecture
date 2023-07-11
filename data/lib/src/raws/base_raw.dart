import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:domain/domain.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_response.dart';

part 'app_result_raw.dart';

part 'token_raw.dart';

part 'user_raw.dart';

part 'base_raw.g.dart';

abstract class BaseRaw<BM extends BaseModel> {
  abstract final String key;

  BM raw2Model();
}

class EmptyRaw extends BaseRaw<EmptyModel> {
  @override
  String get key => '';

  @override
  EmptyModel raw2Model() => EmptyModel();
}
