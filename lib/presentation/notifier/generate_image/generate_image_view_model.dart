import 'package:great_talk/infrastructure/model/rest_api/open_ai/generate_image/response/generate_image_response.dart';
import 'package:great_talk/presentation/state/generate_image/generate_image_state.dart';
import 'package:great_talk/presentation/notifier/purchases/purchases_notifier.dart';
import 'package:great_talk/core/provider/repository/api/api_repository_provider.dart';
import 'package:great_talk/infrastructure/model/result/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'generate_image_view_model.g.dart';

@riverpod
class GenerateImageViewModel extends _$GenerateImageViewModel {
  @override
  FutureOr<GenerateImageState> build() async {
    return const GenerateImageState();
  }

  FutureResult<GenerateImageResponse?> onGenerateButtonPressed(
    String prompt,
    String size,
  ) async {
    final isPremiumSubscribing =
        ref.read(purchasesNotifierProvider).value?.isPremiumSubscribing() ??
        false;
    if (!isPremiumSubscribing) {
      return Result.failure('プレミアムプランに加入する必要があります');
    }
    if (prompt.isEmpty || size.isEmpty) {
      return Result.failure('プロンプトを入力してください');
    }
    final repository = ref.read(apiRepositoryProvider);
    return await repository.generateImage(prompt, size);
  }

  void onSuccess(GenerateImageResponse? res) {
    if (res == null) return;
    final base64 = res.base64;
    final newValue = GenerateImageState(base64: base64);
    state = AsyncData(newValue);
  }
}
