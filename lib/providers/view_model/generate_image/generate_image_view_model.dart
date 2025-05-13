import 'package:great_talk/repository/on_call_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'generate_image_view_model.g.dart';

@riverpod
class GenerateImageViewModel extends _$GenerateImageViewModel {
  @override
  FutureOr<String?> build() async {
    final repository = OnCallRepository();
    const prompt = '炎の勇者と氷の勇者が、闇の世界の城で戦っている様子のファンタジー世界のピクセルアート';
    const size = '512x512';
    final result = await repository.generateImage(prompt, size);
    if (result == null) return null;
    return result.base64;
  }
}
