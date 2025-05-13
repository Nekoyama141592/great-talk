import 'package:great_talk/model/view_model_state/generate_image/generate_image_state.dart';
import 'package:great_talk/repository/on_call_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'generate_image_view_model.g.dart';

@riverpod
class GenerateImageViewModel extends _$GenerateImageViewModel {
  @override
  FutureOr<GenerateImageState> build() async {
    return const GenerateImageState();
  }

  void onGenerateButtonPressed(String prompt, String size) async {
    if (prompt.isEmpty || size.isEmpty) return;
    final repository = OnCallRepository();
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final result = await repository.generateImage(prompt, size);
      final base64 = result?.base64;
      if (base64 == null) return const GenerateImageState();
      return GenerateImageState(base64: base64);
    });
  }
}
