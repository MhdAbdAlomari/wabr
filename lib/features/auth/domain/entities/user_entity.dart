// user.dart
class User {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String? avatar;
  final String createdAt;

  User({
    required this.id,
    required this.name,
    required this.email,
     this.phone,
    this.avatar,
    required this.createdAt,
  });
}

// auth_response.dart
class AuthResponse {
  final User user;
  final String token;

  AuthResponse({
    required this.user,
    required this.token,
  });
}