import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:instapound/src/core/error/failure.dart';
import 'package:instapound/src/features/auth/domain/entities/user.dart';
import 'package:instapound/src/features/auth/domain/usecases/sign_in_uc.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInUC signInUseCase;
  SignInCubit({required this.signInUseCase}) : super(SignInInitial());

  Future<void> signIn(String email, String password) async {
    emit(SignInLoading());
    final result =
        await signInUseCase.call(SignInParams(email: email, password: password));
    result.fold(
      // (failure) => emit(SignInError(message: failure.message)),
      (failure) => emit(SignInError(message: _mapFailureToMessage(failure))),
      (user) => emit(SignInSuccess(user: user)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Server Error";
      case CacheFailure:
        return "Cache Error";
      default:
        return "Unexpected Error";
    }
  }
}
