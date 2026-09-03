import 'package:fpdart/fpdart.dart';
import 'package:wabr/core/error/failure.dart';
import 'package:wabr/features/auth/domain/entities/user_entity.dart';
import 'package:wabr/features/auth/domain/repositories/user_repository.dart';

class LoginUsecase {
  final UserRepository userRepository;
  LoginUsecase({required this.userRepository});
  Future<Either<Failure, AuthResponse>> call(String email, String password) async {
    return await userRepository.login(email, password);
  }
}
