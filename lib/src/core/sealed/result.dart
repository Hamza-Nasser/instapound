// UriBase: lib\src\core\sealed\result.dart
/// Base Result class
/// [S] represents the type of the success value
/// [E] should be [Exception] or a subclass of it
sealed class Result<S, E extends Exception> {
  const Result();

  // copilot code below
  /*
      const Result._();

    const factory Result.success(S value) = Success<S, E>;

    const factory Result.failure(E error) = Failure<S, E>;

    bool get isSuccess => this is Success<S, E>;

    bool get isFailure => this is Failure<S, E>;

    S get value => (this as Success<S, E>).value;

    E get error => (this as Failure<S, E>).error;

    Result<R, E> map<R>(R Function(S value) f) {
      if (this is Success<S, E>) {
        return Result.success(f((this as Success<S, E>).value));
      } else {
        return Result.failure((this as Failure<S, E>).error);
      }
    }

    Result<R, E> flatMap<R>(Result<R, E> Function(S value) f) {
      if (this is Success<S, E>) {
        return f((this as Success<S, E>).value);
      } else {
        return Result.failure((this as Failure<S, E>).error);
      }
    }

    Result<S, E> orElse(Result<S, E> Function(E error) f) {
      if (this is Success<S, E>) {
        return this;
      } else {
        return f((this as Failure<S, E>).error);
      }
    }

  */
}

final class SuccessR<S, E extends Exception> extends Result<S, E> {
  final S value;

  const SuccessR(this.value) : super();
}

final class FailureR<S, E extends Exception> extends Result<S, E> {
  final E exception;

  const FailureR(this.exception) : super();
}
