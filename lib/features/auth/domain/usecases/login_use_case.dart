import 'package:fpdart/fpdart.dart';
import 'package:wabr/core/error/failure.dart';
import 'package:wabr/features/auth/domain/entities/user_entity.dart';
import 'package:wabr/features/auth/domain/repositories/user_repository.dart';

class LoginUseCase {
  final UserRepository userRepository;
  LoginUseCase({required this.userRepository});
  Future<Either<Failure, AuthResponseEntity>> call(
    String email,
    String password,
  ) async {
    return await userRepository.login(email, password);
  }
}
