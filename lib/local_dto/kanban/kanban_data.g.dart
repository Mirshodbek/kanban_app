// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kanban_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalKanbanAdapter extends TypeAdapter<LocalKanban> {
  @override
  final int typeId = 20;

  @override
  LocalKanban read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalKanban(
      id: fields[0] as int?,
      row: fields[1] as String?,
      seqNum: fields[2] as int?,
      text: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LocalKanban obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.row)
      ..writeByte(2)
      ..write(obj.seqNum)
      ..writeByte(3)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalKanbanAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
