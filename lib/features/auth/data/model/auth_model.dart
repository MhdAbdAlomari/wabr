import 'package:wabr/features/auth/data/model/user_model.dart';
import 'package:wabr/features/auth/domain/entities/user_entity.dart';

class AuthModel extends AuthResponse {
  AuthModel({required super.token, required super.user});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      token: json['token'],
      user: UserModel.fromJson(json['user']),
    );
  }
}
