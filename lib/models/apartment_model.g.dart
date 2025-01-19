// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apartment_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OwnerModelAdapter extends TypeAdapter<OwnerModel> {
  @override
  final int typeId = 3;

  @override
  OwnerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OwnerModel(
      id: fields[0] as String,
      name: fields[1] as String,
      photoUrl: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OwnerModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.photoUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OwnerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ApartmentModelAdapter extends TypeAdapter<ApartmentModel> {
  @override
  final int typeId = 0;

  @override
  ApartmentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ApartmentModel(
      id: fields[0] as String,
      imageUrl: fields[1] as String,
      description: fields[2] as String,
      address: fields[3] as String,
      price: fields[4] as double,
      rooms: fields[5] as int,
      area: fields[6] as double,
      city: fields[7] as String,
      owner: fields[9] as OwnerModel,
      isFavorite: fields[8] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ApartmentModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.rooms)
      ..writeByte(6)
      ..write(obj.area)
      ..writeByte(7)
      ..write(obj.city)
      ..writeByte(8)
      ..write(obj.isFavorite)
      ..writeByte(9)
      ..write(obj.owner);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApartmentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
