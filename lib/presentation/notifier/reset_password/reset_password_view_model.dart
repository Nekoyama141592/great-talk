import 'dart:async';

import 'package:great_talk/presentation/state/reset_password/reset_password_state.dart';
import 'package:great_talk/core/provider/repository/auth/auth_repository_provider.dart';
import 'package:great_talk/infrastructure/model/result/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reset_password_view_model.g.dart';

@riverpod
class ResetPasswordViewModel extends _$ResetPasswordViewModel {
  Timer? _timer;

  @override
  ResetPasswordState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    return const ResetPasswordState();
  }

  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }

  void _startResendTimer() {
    const totalSeconds = 60;
    state = state.copyWith(resendLeftTime: totalSeconds);

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.resendLeftTime > 0) {
        state = state.copyWith(resendLeftTime: state.resendLeftTime - 1);
      } else {
        timer.cancel();
      }
    });
  }

  FutureResult<void> sendPasswordResetEmail(String email) async {
    setLoading(true);
    final result = await ref
        .read(authRepositoryProvider)
        .sendPasswordResetEmail(email);
    setLoading(false);

    result.when(
      success: (_) => _startResendTimer(),
      failure: (_) {}, // エラー時は何もしない
    );

    return result;
  }

  bool get canResend => state.resendLeftTime == 0 && !state.isLoading;
}
