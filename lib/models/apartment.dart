class Apartment {
  final String id;
  final String imageUrl;
  final String description;
  final String address;
  final double price;
  final int rooms;
  final double area;
  final String city;

  Apartment({
    required this.id,
    required this.imageUrl,
    required this.description,
    required this.address,
    required this.price,
    required this.rooms,
    required this.area,
    required this.city,
  });

  factory Apartment.fromJson(Map<String, dynamic> json) {
    return Apartment(
      id: json['id'],
      imageUrl: json['image_url'],
      description: json['description'],
      address: json['address'],
      price: json['price'].toDouble(),
      rooms: json['rooms'],
      area: json['area'].toDouble(),
      city: json['city'],
    );
  }
} 