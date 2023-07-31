import 'package:equatable/equatable.dart';

// @Deprecated(
//     'Use Failure from sealed Result class instead. This will be removed in near future')
abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);
  @override
  List<Object> get props => [];
}

// @Deprecated(
//     'Use Failure from sealed Result class instead. This will be removed in near future')
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

// @Deprecated(
//     'Use Failure from sealed Result class instead. This will be removed in near future')
class CacheFailure extends Failure {
  const CacheFailure(super.message);
}
