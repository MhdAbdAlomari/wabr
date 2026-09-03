import 'package:fpdart/fpdart.dart';
import 'package:wabr/core/error/failure.dart';
import 'package:wabr/features/auth/domain/entities/user_entity.dart';
import 'package:wabr/features/auth/domain/repositories/user_repository.dart';

class RegisterUseCase {
  final UserRepository userRepository;
  RegisterUseCase({required this.userRepository});
  Future<Either<Failure, AuthResponse>> call(
    String name,
    String email,
    String password,
    String phone,
  ) async {
    return await userRepository.register(name, email, password, phone);
  }
}
