import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/providers/overrides/prefs_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'terms_notifier.g.dart';

@riverpod
class TermsNotifier extends _$TermsNotifier {
  @override
  bool build() {
    final prefs = ref.read(prefsProvider);
    return prefs.getBool(PrefsKey.isAgreedToTerms.name) ?? false;
  }

  void onAgreeButtonPressed() async {
    state = true;
    final prefs = ref.read(prefsProvider);
    await prefs.setBool(PrefsKey.isAgreedToTerms.name, true);
  }
}