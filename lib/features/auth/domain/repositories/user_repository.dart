import 'package:fpdart/fpdart.dart';
import 'package:wabr/core/error/failure.dart';
import 'package:wabr/features/auth/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getUser();
  Future<Either<Failure, AuthResponse>> login(String email, String password);
  Future<Either<Failure, AuthResponse>> register(
    String name,
    String email,
    String password,
    String phone,
  );
  Future<Either<Failure, User>> logout();
}

