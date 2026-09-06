// user.dart
class UserEntity {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String? avatar;
  final String createdAt;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.avatar,
    required this.createdAt,
  });
}

// auth_response.dart
class AuthResponseEntity {
  final UserEntity user;
  final String token;

  AuthResponseEntity({required this.user, required this.token});
}
