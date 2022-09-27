// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coleta.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ColetaAdapter extends TypeAdapter<Coleta> {
  @override
  final int typeId = 1;

  @override
  Coleta read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Coleta(
      altura: fields[0] as String?,
      peso: fields[1] as String?,
      valorImc: fields[3] as double?,
      retorno: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Coleta obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.altura)
      ..writeByte(1)
      ..write(obj.peso)
      ..writeByte(3)
      ..write(obj.valorImc)
      ..writeByte(4)
      ..write(obj.retorno);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColetaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
