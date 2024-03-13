import 'package:great_talk/infrastructure/open_ai/open_ai_client.dart';
import 'package:great_talk/infrastructure/open_ai/original_dio.dart';
import 'package:great_talk/model/open_ai/generata_image/generate_image_request/generate_image_request.dart';
import 'package:great_talk/model/open_ai/generata_image/generate_image_response/generate_image_response.dart';
import 'package:great_talk/model/open_ai/generate_text/generate_text_request/generate_text_response.dart';
import 'package:great_talk/model/open_ai/generate_text/generate_text_response/generate_text_request.dart';
import 'package:great_talk/repository/result.dart';

class OpenAIRepository {
  final client = OpenAIClient(OriginalDio.withOptions());

  FutureResult<GenerateImageResponse> generateImage(
      GenerateImageRequest request) async {
    try {
      final response = await client.generateImage(request);
      return Result.success(response);
    } catch (e) {
      return const Result.failure();
    }
  }

  FutureResult<GenerateTextResponse> generateText(
      GenerateTextRequest request) async {
    try {
      final response = await client.generateText(request);
      return Result.success(response);
    } catch (e) {
      return const Result.failure();
    }
  }
}
