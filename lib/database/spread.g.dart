// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spread.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpreadAdapter extends TypeAdapter<Spread> {
  @override
  final int typeId = 1;

  @override
  Spread read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Spread(
      name: fields[0] as String,
      cards: (fields[1] as List).cast<String>(),
      readings: (fields[2] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Spread obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.cards)
      ..writeByte(2)
      ..write(obj.readings);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpreadAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
