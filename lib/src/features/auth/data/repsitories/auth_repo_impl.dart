import 'package:dartz/dartz.dart';
import 'package:instapound/src/core/error/exceptions.dart';
import 'package:instapound/src/core/error/failure.dart';
import 'package:instapound/src/core/network/network_info.dart';
import 'package:instapound/src/core/sealed/result.dart';
import 'package:instapound/src/features/auth/data/datasources/auth_local.dart';
import 'package:instapound/src/features/auth/data/datasources/auth_remote.dart';
import 'package:instapound/src/features/auth/data/models/user_model.dart';
import 'package:instapound/src/features/auth/domain/entities/user.dart';
import 'package:instapound/src/features/auth/domain/repositories/auth_rc.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  // @override
  // Future<Either<Failure, User>> signInWithGoogle() async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       final user = await remoteDataSource.signInWithGoogle();
  //       localDataSource.cacheUser(user);
  //       return Right(user);
  //     } on ServerException {
  //       return Left(ServerFailure());
  //     }
  //   } else {
  //     try {
  //       final user = await localDataSource.getLastUser();
  //       return Right(user);
  //     } on CacheException {
  //       return Left(CacheFailure());
  //     }
  //   }
  // }
  @Deprecated(
      "Use sealed Result class instead. This will be removed in near future")
  @override
  Future<Either<Failure, User>> signIn(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final UserModel user = await remoteDataSource.signIn(email, password);
        await localDataSource.cacheUser(user);
        return Right(user);
      } on ServerException catch (_) {
        // return Left(ServerFailure(message: e.message));
        return const Left(ServerFailure("error"));
      }
    } else {
      return const Left(ServerFailure("error"));
      // return Left(ServerFailure(message: "No internet connection"));
      // try {
      //   final User user = await localDataSource.getLastSavedUser();
      // return Right(user);
      // } on CacheException catch (e) {
      //   return Left(CacheFailure(message: e.message));
      // }
    }
  }

  @override
  Future<Result<User, Exception>> signInR(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final UserModel user = await remoteDataSource.signIn(email, password);
        await localDataSource.cacheUser(user);
        return SuccessR(user);
      } on ServerException catch (e) {
        return FailureR(e);
      }
    } else {
      return const FailureR(ServerException(message: "No internet connection"));
    }
  }
}
