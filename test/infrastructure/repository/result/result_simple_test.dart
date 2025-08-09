import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/infrastructure/model/result/result.dart';

void main() {
  group('Result Pattern Matching', () {
    test('should handle success case correctly', () {
      const value = 'test value';
      final result = const Result.success(value);

      final output = result.when(
        success: (val) => 'Success: $val',
        failure: (error) => 'Error: $error',
      );

      expect(output, 'Success: test value');
    });

    test('should handle failure case correctly', () {
      const errorMsg = 'Something went wrong';
      final result = const Result<String>.failure(errorMsg);

      final output = result.when(
        success: (val) => 'Success: $val',
        failure: (error) => 'Error: $error',
      );

      expect(output, 'Error: Something went wrong');
    });

    test('should distinguish between success and failure types', () {
      final successResult = const Result.success(42);
      final failureResult = const Result<int>.failure('error');

      expect(successResult, isA<Success<int>>());
      expect(failureResult, isA<Failure<int>>());
    });

    test('should work with FutureResult typedef', () async {
      FutureResult<String> successFuture() async {
        return const Result.success('async success');
      }

      FutureResult<String> failureFuture() async {
        return const Result.failure('async error');
      }

      final successResult = await successFuture();
      final failureResult = await failureFuture();

      expect(successResult, isA<Success<String>>());
      expect(failureResult, isA<Failure<String>>());
    });

    test('should handle complex data types', () {
      final complexData = {
        'name': 'John',
        'age': 30,
        'hobbies': ['reading', 'coding'],
      };

      final result = Result.success(complexData);

      final isSuccess = result.when(
        success: (_) => true,
        failure: (_) => false,
      );

      expect(isSuccess, true);
    });

    test('should handle null values', () {
      final result = const Result<String?>.success(null);

      final output = result.when(
        success: (val) => val == null ? 'null value' : 'not null',
        failure: (_) => 'error',
      );

      expect(output, 'null value');
    });
  });
}
