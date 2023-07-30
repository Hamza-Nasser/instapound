import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:instapound/src/core/error/failure.dart';
import 'package:instapound/src/core/usecase/usecase.dart';
import 'package:instapound/src/features/auth/domain/entities/user.dart';
import 'package:instapound/src/features/auth/domain/repositories/auth_rc.dart';

@immutable
class SignInUC implements UseCase<User, SignInParams> {
  // SignIn is a callable class: SignIn(email, pass) or SignIn.call(email, pass)
  final AuthRepository repository;

  const SignInUC({required this.repository});

  @override
  Future<Either<Failure, User>> call(params) {
    // Need to await this? No, because it's a Future
    return repository.signIn(params.email, params.password);
  }
}

@immutable
class SignInParams extends NoParams {
  final String email;
  final String password;

  const SignInParams({required this.email, required this.password});
}
