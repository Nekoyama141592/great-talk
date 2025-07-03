abstract class Result<T> {
  const Result();

  const factory Result.success(T value) = Success<T>;
  const factory Result.failure(String message) = Failure<T>;

  TResult when<TResult>({
    required TResult Function(T value) success,
    required TResult Function(String message) failure,
  }) {
    if (this is Success<T>) {
      return success((this as Success<T>).value);
    } else if (this is Failure<T>) {
      return failure((this as Failure<T>).message);
    }
    throw StateError('Unknown Result type');
  }

  TResult? whenOrNull<TResult>({
    TResult Function(T value)? success,
    TResult Function(String message)? failure,
  }) {
    if (this is Success<T>) {
      return success?.call((this as Success<T>).value);
    } else if (this is Failure<T>) {
      return failure?.call((this as Failure<T>).message);
    }
    return null;
  }

  TResult maybeWhen<TResult>({
    TResult Function(T value)? success,
    TResult Function(String message)? failure,
    required TResult Function() orElse,
  }) {
    if (this is Success<T>) {
      return success?.call((this as Success<T>).value) ?? orElse();
    } else if (this is Failure<T>) {
      return failure?.call((this as Failure<T>).message) ?? orElse();
    }
    return orElse();
  }

  TResult map<TResult>({
    required TResult Function(Success<T> success) success,
    required TResult Function(Failure<T> failure) failure,
  }) {
    if (this is Success<T>) {
      return success(this as Success<T>);
    } else if (this is Failure<T>) {
      return failure(this as Failure<T>);
    }
    throw StateError('Unknown Result type');
  }

  TResult? mapOrNull<TResult>({
    TResult Function(Success<T> success)? success,
    TResult Function(Failure<T> failure)? failure,
  }) {
    if (this is Success<T>) {
      return success?.call(this as Success<T>);
    } else if (this is Failure<T>) {
      return failure?.call(this as Failure<T>);
    }
    return null;
  }

  TResult maybeMap<TResult>({
    TResult Function(Success<T> success)? success,
    TResult Function(Failure<T> failure)? failure,
    required TResult Function() orElse,
  }) {
    if (this is Success<T>) {
      return success?.call(this as Success<T>) ?? orElse();
    } else if (this is Failure<T>) {
      return failure?.call(this as Failure<T>) ?? orElse();
    }
    return orElse();
  }
}

final class Success<T> extends Result<T> {
  const Success(this.value);

  final T value;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Success<T> &&
            other.value == value);
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Result<$T>.success(value: $value)';
}

final class Failure<T> extends Result<T> {
  const Failure(this.message);

  final String message;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Failure<T> &&
            other.message == message);
  }

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => 'Result<$T>.failure(message: $message)';
}

typedef FutureResult<T> = Future<Result<T>>;
