import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wabr/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:wabr/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:wabr/features/auth/data/repositories/user_repository_impl.dart';
import 'package:wabr/features/auth/domain/repositories/user_repository.dart';
import 'package:wabr/features/auth/domain/usecases/get_user_use_case.dart';
import 'package:wabr/features/auth/domain/usecases/login_use_case.dart';
import 'package:wabr/features/auth/domain/usecases/logout_use_case.dart';
import 'package:wabr/features/auth/domain/usecases/register_use_case.dart';

final getIt = GetIt.instance;
Future<void> initDependencies() async {
  // --------------------------  External --------------------------
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  getIt.registerSingleton<Dio>(Dio());

  // --------------------------  Auth  --------------------------
  // ------- DataSources -------
  getIt.registerSingleton<AuthRemoteDataSource>(
    AuthRemoteDataSourceImpl(dio: getIt()),
  );
  getIt.registerSingleton<AuthLocalDataSource>(
    AuthLocalDataSourceImpl(prefs: getIt()),
  );
  // ------- Repository -------
  getIt.registerSingleton<UserRepository>(
    UserRepositoryImpl(authRemoteDataSource: getIt(), localDataSource: getIt()),
  );

  // ------- UseCase -------
  getIt.registerSingleton<LoginUseCase>(LoginUseCase(userRepository: getIt()));
  getIt.registerSingleton<RegisterUseCase>(
    RegisterUseCase(userRepository: getIt()),
  );
  getIt.registerSingleton<LogoutUsecase>(
    LogoutUsecase(userRepository: getIt()),
  );
  getIt.registerSingleton<GetUserUsecase>(
    GetUserUsecase(userRepository: getIt()),
  );

  // ------- Bloc -------
  // getIt.registerFactory<AuthBloc>(
  //   () => AuthBloc(
  //     loginUseCase: getIt(),
  //     registerUseCase: getIt(),
  //     logoutUseCase: getIt(),
  //     getUserUseCase: getIt(),
  //   ),
  // );
}
