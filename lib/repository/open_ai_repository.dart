import 'package:great_talk/infrastructure/open_ai/open_ai_client.dart';
import 'package:great_talk/infrastructure/open_ai/original_dio.dart';
import 'package:great_talk/model/rest_api/open_ai/generata_image/generate_image_request/generate_image_request.dart';
import 'package:great_talk/model/rest_api/open_ai/generata_image/generate_image_response/generate_image_response.dart';
import 'package:great_talk/model/rest_api/open_ai/generate_text/generate_text_request/generate_text_response.dart';
import 'package:great_talk/model/rest_api/open_ai/generate_text/generate_text_response/generate_text_request.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:great_talk/utility/env_utility.dart';

class OpenAIRepository {
  OpenAIClient get client => OpenAIClient(OriginalDio.withOptions(
      baseUrl: "https://api.openai.com/v1", token: EnvUtility().openAiApiKey));

  FutureResult<GenerateImageResponse> generateImage(
      GenerateImageRequest request) async {
    try {
      final response = await client.generateImage(request);
      return Result.success(response);
    } catch (e) {
      return Result.failure(e);
    }
  }

  FutureResult<GenerateTextResponse> generateText(
      GenerateTextRequest request) async {
    try {
      final response = await client.generateText(request);
      return Result.success(response);
    } catch (e) {
      return Result.failure(e);
    }
  }
}
