import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:instapound/src/core/error/exceptions.dart';
import 'package:instapound/src/core/sealed/result.dart';
import 'package:instapound/src/features/auth/domain/entities/user.dart';
import 'package:instapound/src/features/auth/domain/usecases/sign_in_uc.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInUCR signInUseCase;
  late User? user;
  SignInCubit({required this.signInUseCase}) : super(SignInInitial());
  // late User user;
  Future<void> signIn(String email, String password) async {
    emit(SignInLoading());
    final result = await signInUseCase
        .call(SignInParams(email: email, password: password));
    final res = switch (result) {
      SuccessR(value: final user) => user,
      FailureR(exception: final exception) => _mapFailureToMessage(exception),
    };
    if (res is User) {
      user = res;
      emit(SignInSuccess(user: res));
    } else {
      emit(SignInError(message: res as String));
    }
  }

  String _mapFailureToMessage(Exception failure) {
    switch (failure.runtimeType) {
      case ServerException:
        return (failure as ServerException).message;
      // case CacheFailure:
      //   return "Cache Error";
      default:
        return "Unexpected Error";
    }
  }
}
