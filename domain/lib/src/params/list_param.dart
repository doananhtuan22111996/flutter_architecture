part of 'base_param.dart';

@JsonSerializable()
@CopyWith()
class ListParam {
  final int page;
  final int limit;

  ListParam({this.page = 1, this.limit = 25 });

  Map<String, dynamic> get toJson => _$ListParamToJson(this);
}