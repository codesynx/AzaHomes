import 'package:hive/hive.dart';
import 'apartment_model.dart';

part 'booked_apartment_model.g.dart';

@HiveType(typeId: 1)
class BookedApartmentModel extends HiveObject {
  @HiveField(0)
  final ApartmentModel apartment;

  @HiveField(1)
  final DateTime bookingDate;

  @HiveField(2)
  final DateTime checkIn;

  @HiveField(3)
  final DateTime checkOut;

  BookedApartmentModel({
    required this.apartment,
    required this.bookingDate,
    required this.checkIn,
    required this.checkOut,
  });
} 