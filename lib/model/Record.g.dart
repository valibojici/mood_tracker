// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecordAdapter extends TypeAdapter<Record> {
  @override
  final int typeId = 0;

  @override
  Record read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Record(
      data: fields[0] as DateTime,
      mood: fields[1] as int,
      emotions: (fields[2] as List).cast<String>(),
      notes: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Record obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.data)
      ..writeByte(1)
      ..write(obj.mood)
      ..writeByte(2)
      ..write(obj.emotions)
      ..writeByte(3)
      ..write(obj.notes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
