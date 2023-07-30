import 'package:dartz/dartz.dart';
import 'package:instapound/src/core/error/failure.dart';
import 'package:instapound/src/features/auth/domain/entities/user.dart';

// contract for the data layer
abstract class AuthRepository {
  Future<Either<Failure, User>> signIn(String email, String password);
}
