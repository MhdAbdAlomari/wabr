import 'package:fpdart/fpdart.dart';
import 'package:wabr/core/error/failure.dart';
import 'package:wabr/features/auth/domain/repositories/user_repository.dart';

class LogoutUsecase {
  final UserRepository userRepository;
  LogoutUsecase({required this.userRepository});
  Future<Either<Failure, void>> call() async {
    return await userRepository.logout();
  }
}
