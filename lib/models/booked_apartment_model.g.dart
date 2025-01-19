// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booked_apartment_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookedApartmentModelAdapter extends TypeAdapter<BookedApartmentModel> {
  @override
  final int typeId = 1;

  @override
  BookedApartmentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookedApartmentModel(
      apartment: fields[0] as ApartmentModel,
      bookingDate: fields[1] as DateTime,
      checkIn: fields[2] as DateTime,
      checkOut: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, BookedApartmentModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.apartment)
      ..writeByte(1)
      ..write(obj.bookingDate)
      ..writeByte(2)
      ..write(obj.checkIn)
      ..writeByte(3)
      ..write(obj.checkOut);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookedApartmentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
