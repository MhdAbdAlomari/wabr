import 'package:wabr/features/auth/data/model/user_response_model.dart';
import 'package:wabr/features/auth/domain/entities/user_entity.dart';

class AuthResponseModel extends AuthResponseEntity {
  AuthResponseModel({required super.token, required super.user});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      token: json['token'],
      user: UserModel.fromJson(json['user']),
    );
  }
}
