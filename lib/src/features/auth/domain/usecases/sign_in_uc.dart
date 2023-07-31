import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:instapound/src/core/error/failure.dart';
import 'package:instapound/src/core/sealed/result.dart';
import 'package:instapound/src/core/usecase/usecase.dart';
import 'package:instapound/src/features/auth/domain/entities/user.dart';
import 'package:instapound/src/features/auth/domain/repositories/auth_rc.dart';

@Deprecated(
    "Use sealed Result class instead. This will be removed in near future")
@immutable
class SignInUC implements UseCase<User, SignInParams> {
  // SignIn is a callable class: SignIn(email, pass) or SignIn.call(email, pass)
  final AuthRepository repository;

  const SignInUC({required this.repository});

  // @override
  // Future<Result<User, Exception>> call(SignInParams params) {
  //   return repository.signInR(params.email, params.password);
  // }
  @Deprecated(
      "Use sealed Result class instead. This will be removed in near future")
  @override
  Future<Either<Failure, User>> call(params) {
    // Need to await this? No, because it's a Future
    return repository.signIn(params.email, params.password);
  }
}

@immutable
class SignInUCR implements UseCaseR<User, SignInParams> {
  // SignIn is a callable class: SignIn(email, pass) or SignIn.call(email, pass)
  final AuthRepository repository;

  const SignInUCR({required this.repository});

  @override
  Future<Result<User, Exception>> call(SignInParams params) {
    return repository.signInR(params.email, params.password);
  }
}

@immutable
class SignInParams extends NoParams {
  final String email;
  final String password;

  const SignInParams({required this.email, required this.password});
}
