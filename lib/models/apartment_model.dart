import 'package:hive/hive.dart';

part 'apartment_model.g.dart';

@HiveType(typeId: 3)
class OwnerModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String? photoUrl;

  OwnerModel({
    required this.id,
    required this.name,
    this.photoUrl,
  });

  factory OwnerModel.fromJson(Map<String, dynamic> json) {
    return OwnerModel(
      id: json['id'],
      name: json['name'],
      photoUrl: json['photo_url'],
    );
  }
}

@HiveType(typeId: 0)
class ApartmentModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String imageUrl;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String address;

  @HiveField(4)
  final double price;

  @HiveField(5)
  final int rooms;

  @HiveField(6)
  final double area;

  @HiveField(7)
  final String city;

  @HiveField(8)
  bool isFavorite;

  @HiveField(9)
  final OwnerModel owner;

  ApartmentModel({
    required this.id,
    required this.imageUrl,
    required this.description,
    required this.address,
    required this.price,
    required this.rooms,
    required this.area,
    required this.city,
    required this.owner,
    this.isFavorite = false,
  });

  factory ApartmentModel.fromJson(Map<String, dynamic> json) {
    return ApartmentModel(
      id: json['id'],
      imageUrl: json['image_url'],
      description: json['description'],
      address: json['address'],
      price: json['price'].toDouble(),
      rooms: json['rooms'],
      area: json['area'].toDouble(),
      city: json['city'],
      owner: OwnerModel.fromJson(json['owner']),
    );
  }
} 