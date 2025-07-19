// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReadModelAdapter extends TypeAdapter<ReadModel> {
  @override
  final int typeId = 0;

  @override
  ReadModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReadModel(
      titleRead: fields[0] as String,
      chapterRead: fields[1] as String,
      noteRead: fields[2] as String,
      color: fields[3] as int,
      status: fields[4] as String,
      statusColor: fields[5] as int,
      isFavorite: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ReadModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.titleRead)
      ..writeByte(1)
      ..write(obj.chapterRead)
      ..writeByte(2)
      ..write(obj.noteRead)
      ..writeByte(3)
      ..write(obj.color)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.statusColor)
      ..writeByte(6)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReadModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
