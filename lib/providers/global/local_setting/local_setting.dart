import 'package:great_talk/model/global/local_setting/local_setting_state.dart';
import 'package:great_talk/repository/real/local/local_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_setting.g.dart';

@Riverpod(keepAlive: true)
class LocalSetting extends _$LocalSetting {
  
  @override
  LocalSettingState build() {
    final repository = ref.watch(localRepositoryProvider);
    final isDarkTheme = repository.getIsDarkTheme();
    final needFirstMessage =
        repository.getNeedFirstMessage();
    return LocalSettingState(
      isDarkTheme: isDarkTheme,
      needFirstMessage: needFirstMessage,
    );
  }

  void onThemeSwichChanged(bool value) async {
    state = state.copyWith(isDarkTheme: value);
    ref.read(localRepositoryProvider).setIsDarkTheme(value);
  }

  void onNeedFirstMessageSwichChanged(bool value) async {
    state = state.copyWith(needFirstMessage: value);
    ref.read(localRepositoryProvider).setNeedFirstMessage(value);
  }
}
