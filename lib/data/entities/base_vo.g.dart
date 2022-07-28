// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TokenVoAdapter extends TypeAdapter<TokenVo> {
  @override
  final int typeId = 1;

  @override
  TokenVo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TokenVo(
      token: fields[0] as String?,
      refreshToken: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TokenVo obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.refreshToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TokenVoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TravelUserVoAdapter extends TypeAdapter<TravelUserVo> {
  @override
  final int typeId = 1;

  @override
  TravelUserVo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TravelUserVo(
      id: fields[0] as int?,
      userName: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TravelUserVo obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TravelUserVoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
