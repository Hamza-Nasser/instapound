// T is the return type, P is the parameter type
import 'package:equatable/equatable.dart';
import 'package:instapound/src/core/sealed/result.dart';

// @Deprecated("Use sealed Result class instead. This will be removed in near future")
// abstract class UseCase<T, P> {
//   Future<Either<Failure, T>> call(P params); // callable class (function)
// }
// @Deprecated("Use sealed Result class instead. This will be removed in near future")
// abstract class UseCaseNoParams<T> {
//   Future<Either<Failure, T>> call();
// }

abstract class UseCaseR<T, P> {
  // Unlike UseCase with dartz Either, this one returns a Result, the left side of which is a success return type, and the right side is an exception
  Future<Result<T, Exception>> call(P params);
}

class NoParams extends Equatable {
  const NoParams();
  @override
  List<Object?> get props => [];
}
