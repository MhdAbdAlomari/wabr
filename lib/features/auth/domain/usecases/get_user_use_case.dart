import 'package:fpdart/fpdart.dart';
import 'package:wabr/core/error/failure.dart';
import 'package:wabr/features/auth/domain/entities/user_entity.dart';
import 'package:wabr/features/auth/domain/repositories/user_repository.dart';

class GetUserUsecase {
  final UserRepository userRepository;

  GetUserUsecase({required this.userRepository});
  
  Future<Either<Failure, User>> call() async {
    return await userRepository.getUser();
  }
}
