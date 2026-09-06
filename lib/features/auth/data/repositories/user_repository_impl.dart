import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:wabr/core/error/failure.dart';
import 'package:wabr/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:wabr/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:wabr/features/auth/domain/entities/user_entity.dart';
import 'package:wabr/features/auth/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource localDataSource;

  UserRepositoryImpl({
    required this.authRemoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, UserEntity>> getUser() async {
    try {
      final user = await authRemoteDataSource.getUser();
      return Right(user);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponseEntity>> login(
    String email,
    String password,
  ) async {
    try {
      final result = await authRemoteDataSource.login(email, password);
      await localDataSource.saveToken(result.token);
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await localDataSource.deleteToken();
      await authRemoteDataSource.logout();
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponseEntity>> register(
    String name,
    String email,
    String password,
    String phone,
  ) async {
    try {
      final result = await authRemoteDataSource.register(
        name,
        email,
        password,
        phone,
      );
      await localDataSource.saveToken(result.token);
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
