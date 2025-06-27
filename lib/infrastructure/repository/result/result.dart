import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_mixin.dart';

class Result<T> with _$Result<T> {
  const factory Result.success(T value) = Success<T>;
  const factory Result.failure(String msg) = Failure<T>;
}

typedef FutureResult<T> = Future<Result<T>>;
