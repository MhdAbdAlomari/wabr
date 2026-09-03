import 'package:wabr/features/auth/domain/entities/user_entity.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    super.phone,
    super.avatar,
    required super.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      avatar: json['avatar'],
      createdAt: json['created_at'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'avatar': avatar,
      'created_at': createdAt,
    };
  }
}
