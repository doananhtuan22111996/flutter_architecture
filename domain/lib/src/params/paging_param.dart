part of 'base_param.dart';

@JsonSerializable()
@CopyWith()
class PagingParam extends BaseParam {
  final int page;
  final int limit;
  final String lang;

  PagingParam({this.page = 1, this.limit = 25, this.lang = 'en'});

  Map<String, dynamic> get toJson => _$PagingParamToJson(this);
}
