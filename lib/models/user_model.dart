import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 2)
class UserModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String? email;

  @HiveField(2)
  String? phone;

  UserModel({
    required this.name,
    this.email,
    this.phone,
  });
} 