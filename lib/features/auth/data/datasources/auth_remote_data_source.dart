import 'package:dio/dio.dart';
import 'package:wabr/features/auth/data/model/auth_response_model.dart';
import 'package:wabr/features/auth/data/model/user_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> login(String email, String password);
  Future<AuthResponseModel> register(
    String name,
    String email,
    String password,
    String phone,
  );
  Future<void> logout();
  Future<UserModel> getUser();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;
  AuthRemoteDataSourceImpl({required this.dio});

  @override
  Future<UserModel> getUser() async {
    final response = await dio.get('/api/profile');
    return UserModel.fromJson(response.data['data']);
  }

  @override
  Future<AuthResponseModel> login(String email, String password) async {
    final response = await dio.post(
      '/api/login',
      data: {'email': email, 'password': password},
    );
    return AuthResponseModel.fromJson(response.data['data']);
  }

  @override
  Future<void> logout() async {
    await dio.post('/api/logout');
  }

  @override
  Future<AuthResponseModel> register(
    String name,
    String email,
    String password,
    String phone,
  ) async {
    final response = await dio.post(
      '/api/register',
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    );
    return AuthResponseModel.fromJson(response.data['data']);
  }
}
