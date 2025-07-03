import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:great_talk/infrastructure/repository/result/result.dart';

/// Utility class for common AsyncValue state management patterns
class AsyncStateUtil {
  /// Validates that the current state is not loading
  /// Returns failure if the state is loading, success otherwise
  static Result<String> validateNotLoading<T>(AsyncValue<T> state) {
    if (state.isLoading) {
      return const Result.failure('ロード中です');
    }
    return const Result.success('OK');
  }

  /// Sets the state to loading
  static AsyncValue<T> setLoading<T>() => const AsyncValue.loading();

  /// Safely updates the state data using a transformer function
  /// If the current state is not data, returns the current state unchanged
  static AsyncValue<T> updateStateData<T>(
    AsyncValue<T> currentState,
    T Function(T current) transformer,
  ) {
    return currentState.when(
      data: (data) => AsyncValue.data(transformer(data)),
      error: (error, stackTrace) => currentState,
      loading: () => currentState,
    );
  }

  /// Creates a new data state with the provided value
  static AsyncValue<T> createDataState<T>(T data) => AsyncValue.data(data);

  /// Safely gets the data from an AsyncValue state
  /// Returns null if the state is not data
  static T? getStateData<T>(AsyncValue<T> state) {
    return state.when(
      data: (data) => data,
      error: (_, __) => null,
      loading: () => null,
    );
  }

  /// Executes an async operation while managing loading state
  /// Automatically sets loading state before execution and restores state after
  static Future<Result<R>> executeWithLoadingState<T, R>({
    required AsyncValue<T> Function() getCurrentState,
    required void Function(AsyncValue<T>) setState,
    required Future<Result<R>> Function() operation,
    T? fallbackState,
  }) async {
    final currentState = getCurrentState();
    final currentData = getStateData(currentState);

    // Set loading state
    setState(setLoading<T>());

    try {
      // Execute the operation
      final result = await operation();

      // Restore previous state or use fallback
      if (currentData != null) {
        setState(createDataState(currentData));
      } else if (fallbackState != null) {
        setState(createDataState(fallbackState));
      }

      return result;
    } catch (e) {
      // Restore previous state on error
      if (currentData != null) {
        setState(createDataState(currentData));
      } else if (fallbackState != null) {
        setState(createDataState(fallbackState));
      }

      return Result.failure('処理中にエラーが発生しました: $e');
    }
  }

  /// Handles Result pattern with state updates
  /// Executes success callback for success results, failure callback for failures
  static Future<void> handleResult<T, S>(
    Result<T> result, {
    required Future<void> Function(T data) onSuccess,
    required Future<void> Function(String error) onFailure,
  }) async {
    await result.when(success: onSuccess, failure: onFailure);
  }
}
