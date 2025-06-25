import 'package:great_talk/provider/repository/local/local_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'terms_notifier.g.dart';

@riverpod
class TermsNotifier extends _$TermsNotifier {
  @override
  bool build() {
    return ref.watch(localRepositoryProvider).getIsAgreedToTerms();
  }

  void onAgreeButtonPressed() async {
    state = true;
    await ref.read(localRepositoryProvider).setIsAgreedToTerms(true);
  }
}
