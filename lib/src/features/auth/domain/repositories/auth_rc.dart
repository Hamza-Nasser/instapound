import 'package:dartz/dartz.dart';
import 'package:instapound/src/core/error/failure.dart';
import 'package:instapound/src/core/sealed/result.dart';
import 'package:instapound/src/features/auth/domain/entities/user.dart';

// contract for the data layer
abstract class AuthRepository {
  @Deprecated("Use sealed Result class instead. This will be removed in near future")
  Future<Either<Failure, User>> signIn(String email, String password);

  Future<Result<User, Exception>> signInR(String email, String password);
}
