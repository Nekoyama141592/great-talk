import 'package:great_talk/presentation/state/local_setting/local_setting_state.dart';
import 'package:great_talk/core/provider/repository/local/local_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_setting.g.dart';

@Riverpod(keepAlive: true)
class LocalSetting extends _$LocalSetting {
  @override
  LocalSettingState build() {
    final repository = ref.watch(localRepositoryProvider);
    final needFirstMessage = repository.getNeedFirstMessage();
    return LocalSettingState(needFirstMessage: needFirstMessage);
  }

  void onNeedFirstMessageSwichChanged(bool value) async {
    state = state.copyWith(needFirstMessage: value);
    ref.read(localRepositoryProvider).setNeedFirstMessage(value);
  }
}
