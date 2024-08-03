part of 'base_param.dart';

@JsonSerializable()
@CopyWith()
class PagingRemoveParam extends BaseParam {
  final int id;

  PagingRemoveParam({required this.id});

  Map<String, dynamic> get toJson => _$PagingRemoveParamToJson(this);
}
