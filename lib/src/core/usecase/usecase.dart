// T is the return type, P is the parameter type
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:instapound/src/core/error/failure.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure, T>> call(P params); // callable class (function)
}

class NoParams extends Equatable {
  const NoParams();
  @override
  List<Object?> get props => [];
}
