import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/model/global/local_setting/local_setting_state.dart';
import 'package:great_talk/providers/overrides/prefs_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_setting.g.dart';

@Riverpod(keepAlive: true)
class LocalSetting extends _$LocalSetting {
  @override
  LocalSettingState build() {
    final prefs = ref.read(prefsProvider);
    final isDarkTheme = prefs.getBool(PrefsKey.isDarkTheme.name) ?? true;
    final needFirstMessage =
        prefs.getBool(PrefsKey.needFirstMessage.name) ?? true;
    return LocalSettingState(
      isDarkTheme: isDarkTheme,
      needFirstMessage: needFirstMessage,
    );
  }

  void onThemeSwichChanged(bool value) async {
    state = state.copyWith(isDarkTheme: value);
    final prefs = ref.read(prefsProvider);
    prefs.setBool(PrefsKey.isDarkTheme.name, value);
  }

  void onNeedFirstMessageSwichChanged(bool value) async {
    state = state.copyWith(needFirstMessage: value);
    final prefs = ref.read(prefsProvider);
    prefs.setBool(PrefsKey.needFirstMessage.name, value);
  }
}
