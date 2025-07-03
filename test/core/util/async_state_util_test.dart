import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:great_talk/core/util/async_state_util.dart';
import 'package:great_talk/infrastructure/model/result/result.dart';

void main() {
  group('AsyncStateUtil', () {
    group('validateNotLoading', () {
      test('should return success when state is not loading', () {
        const state = AsyncValue.data('test');

        final result = AsyncStateUtil.validateNotLoading(state);

        expect(result, isA<Success<String>>());
        result.when(
          success: (value) => expect(value, 'OK'),
          failure: (_) => fail('Should not fail'),
        );
      });

      test('should return failure when state is loading', () {
        const state = AsyncValue<String>.loading();

        final result = AsyncStateUtil.validateNotLoading(state);

        expect(result, isA<Failure<String>>());
        result.when(
          success: (_) => fail('Should not succeed'),
          failure: (error) => expect(error, 'ロード中です'),
        );
      });

      test('should return success when state is error', () {
        final state = AsyncValue<String>.error(
          Exception('test error'),
          StackTrace.current,
        );

        final result = AsyncStateUtil.validateNotLoading(state);

        expect(result, isA<Success<String>>());
        result.when(
          success: (value) => expect(value, 'OK'),
          failure: (_) => fail('Should not fail'),
        );
      });
    });

    group('setLoading', () {
      test('should create loading state', () {
        final state = AsyncStateUtil.setLoading<String>();

        expect(state.isLoading, true);
        expect(state.hasValue, false);
        expect(state.hasError, false);
      });
    });

    group('updateStateData', () {
      test('should update data state', () {
        const originalState = AsyncValue.data('original');

        final updatedState = AsyncStateUtil.updateStateData(
          originalState,
          (data) => '$data updated',
        );

        updatedState.when(
          data: (value) => expect(value, 'original updated'),
          error: (_, __) => fail('Should not be error'),
          loading: () => fail('Should not be loading'),
        );
      });

      test('should not update loading state', () {
        const originalState = AsyncValue<String>.loading();

        final updatedState = AsyncStateUtil.updateStateData(
          originalState,
          (data) => '$data updated',
        );

        expect(updatedState.isLoading, true);
      });

      test('should not update error state', () {
        final originalError = Exception('test error');
        final originalStack = StackTrace.current;
        final originalState = AsyncValue<String>.error(
          originalError,
          originalStack,
        );

        final updatedState = AsyncStateUtil.updateStateData(
          originalState,
          (data) => '$data updated',
        );

        updatedState.when(
          data: (_) => fail('Should not be data'),
          error: (error, stackTrace) {
            expect(error, originalError);
            expect(stackTrace, originalStack);
          },
          loading: () => fail('Should not be loading'),
        );
      });
    });

    group('createDataState', () {
      test('should create data state', () {
        final state = AsyncStateUtil.createDataState('test data');

        state.when(
          data: (value) => expect(value, 'test data'),
          error: (_, __) => fail('Should not be error'),
          loading: () => fail('Should not be loading'),
        );
      });
    });

    group('getStateData', () {
      test('should return data from data state', () {
        const state = AsyncValue.data('test data');

        final result = AsyncStateUtil.getStateData(state);

        expect(result, 'test data');
      });

      test('should return null from loading state', () {
        const state = AsyncValue<String>.loading();

        final result = AsyncStateUtil.getStateData(state);

        expect(result, null);
      });

      test('should return null from error state', () {
        final state = AsyncValue<String>.error(
          Exception('test error'),
          StackTrace.current,
        );

        final result = AsyncStateUtil.getStateData(state);

        expect(result, null);
      });
    });

    group('executeWithLoadingState', () {
      test('should manage loading state correctly on success', () async {
        var currentState = const AsyncValue.data('initial');
        final states = <AsyncValue<String>>[];

        void setState(AsyncValue<String> state) {
          currentState = state;
          states.add(state);
        }

        final result =
            await AsyncStateUtil.executeWithLoadingState<String, String>(
              getCurrentState: () => currentState,
              setState: setState,
              operation: () async => const Result.success('operation result'),
            );

        // Should have set loading, then restored original state
        expect(states.length, 2);
        expect(states[0].isLoading, true);
        states[1].when(
          data: (value) => expect(value, 'initial'),
          error: (_, __) => fail('Should not be error'),
          loading: () => fail('Should not be loading'),
        );

        result.when(
          success: (value) => expect(value, 'operation result'),
          failure: (_) => fail('Should not fail'),
        );
      });

      test('should manage loading state correctly on failure', () async {
        var currentState = const AsyncValue.data('initial');
        final states = <AsyncValue<String>>[];

        void setState(AsyncValue<String> state) {
          currentState = state;
          states.add(state);
        }

        final result =
            await AsyncStateUtil.executeWithLoadingState<String, String>(
              getCurrentState: () => currentState,
              setState: setState,
              operation: () async => const Result.failure('operation failed'),
            );

        // Should have set loading, then restored original state
        expect(states.length, 2);
        expect(states[0].isLoading, true);
        states[1].when(
          data: (value) => expect(value, 'initial'),
          error: (_, __) => fail('Should not be error'),
          loading: () => fail('Should not be loading'),
        );

        result.when(
          success: (_) => fail('Should not succeed'),
          failure: (error) => expect(error, 'operation failed'),
        );
      });

      test('should use fallback state when no current data', () async {
        var currentState = const AsyncValue<String>.loading();
        final states = <AsyncValue<String>>[];

        void setState(AsyncValue<String> state) {
          currentState = state;
          states.add(state);
        }

        await AsyncStateUtil.executeWithLoadingState<String, String>(
          getCurrentState: () => currentState,
          setState: setState,
          operation: () async => const Result.success('operation result'),
          fallbackState: 'fallback',
        );

        // Should have set loading, then fallback state
        expect(states.length, 2);
        expect(states[0].isLoading, true);
        states[1].when(
          data: (value) => expect(value, 'fallback'),
          error: (_, __) => fail('Should not be error'),
          loading: () => fail('Should not be loading'),
        );
      });

      test('should handle exceptions in operation', () async {
        var currentState = const AsyncValue.data('initial');
        final states = <AsyncValue<String>>[];

        void setState(AsyncValue<String> state) {
          currentState = state;
          states.add(state);
        }

        final result =
            await AsyncStateUtil.executeWithLoadingState<String, String>(
              getCurrentState: () => currentState,
              setState: setState,
              operation: () async => throw Exception('operation error'),
            );

        // Should have set loading, then restored original state
        expect(states.length, 2);
        expect(states[0].isLoading, true);
        states[1].when(
          data: (value) => expect(value, 'initial'),
          error: (_, __) => fail('Should not be error'),
          loading: () => fail('Should not be loading'),
        );

        result.when(
          success: (_) => fail('Should not succeed'),
          failure: (error) => expect(error, contains('処理中にエラーが発生しました')),
        );
      });
    });

    group('handleResult', () {
      test('should call onSuccess for success result', () async {
        var successCalled = false;
        var failureCalled = false;

        await AsyncStateUtil.handleResult<String, void>(
          const Result.success('test'),
          onSuccess: (data) async {
            expect(data, 'test');
            successCalled = true;
          },
          onFailure: (error) async {
            failureCalled = true;
          },
        );

        expect(successCalled, true);
        expect(failureCalled, false);
      });

      test('should call onFailure for failure result', () async {
        var successCalled = false;
        var failureCalled = false;

        await AsyncStateUtil.handleResult<String, void>(
          const Result.failure('test error'),
          onSuccess: (data) async {
            successCalled = true;
          },
          onFailure: (error) async {
            expect(error, 'test error');
            failureCalled = true;
          },
        );

        expect(successCalled, false);
        expect(failureCalled, true);
      });
    });
  });
}
