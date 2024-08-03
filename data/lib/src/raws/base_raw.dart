import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_raw.g.dart';

part 'app_response.dart';

part 'app_result_raw.dart';

part 'token_raw.dart';

part 'user_raw.dart';

abstract class BaseRaw<BM extends BaseModel> {
  // Key for Hive
  abstract final String key;

  BM raw2Model();
}
