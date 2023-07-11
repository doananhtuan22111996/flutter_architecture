part of 'base_param.dart';

@JsonSerializable()
@CopyWith()
class AppParam {
  final int page;
  final int limit;

  AppParam({this.page = 1, this.limit = 25});

  Map<String, dynamic> get toJson => _$AppParamToJson(this);
}
