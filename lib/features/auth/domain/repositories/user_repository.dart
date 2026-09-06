import 'package:fpdart/fpdart.dart';
import 'package:wabr/core/error/failure.dart';
import 'package:wabr/features/auth/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getUser();
  Future<Either<Failure, AuthResponseEntity>> login(
    String email,
    String password,
  );
  Future<Either<Failure, AuthResponseEntity>> register(
    String name,
    String email,
    String password,
    String phone,
  );
  Future<Either<Failure, void>> logout();
}
