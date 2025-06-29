import 'package:great_talk/core/provider/keep_alive/stream/auth/stream_auth_provider.dart';
import 'package:great_talk/domain/entity/view_model_state/verify_email/verify_email_state.dart';
import 'package:great_talk/core/provider/repository/auth/auth_repository_provider.dart';
import 'package:great_talk/infrastructure/repository/result/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'verify_email_view_model.g.dart';

@riverpod
class VerifyEmailViewModel extends _$VerifyEmailViewModel {
  @override
  Future<VerifyEmailState> build() async {
    final email = ref.watch(authEmailProvider);
    if (email == null) throw Exception();
    // 初期化時に確認メールを送信
    final result =
        await ref.read(authRepositoryProvider).sendEmailVerification();

    return result.when(
      success: (_) {
        // 送信成功時は再送信不可・60秒カウントダウン開始状態
        return VerifyEmailState(
          canResend: false,
          resendSecondsLeft: 60,
          email: email,
        );
      },
      failure: (_) {
        // 送信失敗時は再送信可能状態
        return VerifyEmailState(
          canResend: true,
          resendSecondsLeft: 0,
          email: email,
        );
      },
    );
  }

  /// Presentation層のタイマーから呼び出すことで、残り秒数を1減らす
  void decrementResendSeconds() {
    final currentState = state.value;
    if (currentState == null) return;

    if (currentState.resendSecondsLeft > 1) {
      state = AsyncValue.data(
        currentState.copyWith(
          resendSecondsLeft: currentState.resendSecondsLeft - 1,
          canResend: false,
        ),
      );
    } else {
      state = AsyncValue.data(
        currentState.copyWith(resendSecondsLeft: 0, canResend: true),
      );
    }
  }

  FutureResult<bool> resendVerificationEmail() async {
    final currentState = state.value;
    if (currentState == null || !currentState.canResend) {
      return const Result.failure('まだ再送信できません');
    }

    final result =
        await ref.read(authRepositoryProvider).sendEmailVerification();

    return result.when(
      success: (_) {
        // Presentation層でタイマーをリセットすることを想定し、状態のみ初期化
        final currentState = state.value;
        if (currentState != null) {
          state = AsyncValue.data(
            currentState.copyWith(canResend: false, resendSecondsLeft: 60),
          );
        }
        return const Result.success(true);
      },
      failure: (message) => Result.failure(message),
    );
  }

  FutureResult<bool> checkEmailVerification() async {
    // ローディング状態に設定
    state = const AsyncValue.loading();

    final result = await ref.read(authRepositoryProvider).reloadCurrentUser();

    // 結果に関わらず、元の状態に戻す
    final currentState = state.value;
    if (currentState != null) {
      state = AsyncValue.data(currentState);
    }

    return result;
  }

  FutureResult<bool> signOut() async {
    return await ref.read(authRepositoryProvider).signOut();
  }
}
