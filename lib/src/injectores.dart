import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:instapound/src/core/api/endpoints.dart';
import 'package:instapound/src/core/network/network_info.dart';
import 'package:instapound/src/features/auth/data/datasources/auth_local.dart';
import 'package:instapound/src/features/auth/data/datasources/auth_remote.dart';
import 'package:instapound/src/features/auth/data/repsitories/auth_repo_impl.dart';
import 'package:instapound/src/features/auth/domain/repositories/auth_rc.dart';
import 'package:instapound/src/features/auth/domain/usecases/sign_in_uc.dart';
import 'package:instapound/src/features/auth/presentation/screens/signin/cubit/sign_in_cubit.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // Features - Auth
  // Bloc
  sl.registerFactory(() => SignInCubit(signInUseCase: sl()));
  // Use cases
  sl.registerLazySingleton(() => SignInUCR(repository: sl()));
  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sharedPreferences: sl()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Dio(
        BaseOptions(
          baseUrl: Endpoints.baseUrl,
          // connectTimeout: 5000,
          // receiveTimeout: 3000,
        ),
      ));
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
