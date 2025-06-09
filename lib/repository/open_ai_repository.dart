import 'package:flutter/foundation.dart';
import 'package:great_talk/infrastructure/open_ai/open_ai_client.dart';
import 'package:great_talk/model/rest_api/open_ai/generata_image/generate_image_request/generate_image_request.dart';
import 'package:great_talk/model/rest_api/open_ai/generata_image/generate_image_response/generate_image_response.dart';
import 'package:great_talk/model/rest_api/open_ai/generate_text/generate_text_request/generate_text_response.dart';
import 'package:great_talk/model/rest_api/open_ai/generate_text/generate_text_response/generate_text_request.dart';
import 'package:great_talk/repository/result/result.dart';

class OpenAIRepository {
  OpenAIRepository(this.client);
  final OpenAIClient client;

  FutureResult<GenerateImageResponse> generateImage(
    GenerateImageRequest request,
  ) async {
    try {
      final response = await client.generateImage(request);
      return Result.success(response);
    } catch (e) {
      debugPrint('generateImage: ${e.toString()}'); // Modified line
      return Result.failure('画像の生成が失敗しました');
    }
  }

  FutureResult<GenerateTextResponse> generateText(
    GenerateTextRequest request,
  ) async {
    try {
      final response = await client.generateText(request);
      return Result.success(response);
    } catch (e) {
      debugPrint('generateText: ${e.toString()}'); // Modified line
      return Result.failure('テキストの生成が失敗しました');
    }
  }
}
