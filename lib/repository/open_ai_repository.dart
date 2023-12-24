import 'package:flutter/foundation.dart';
import 'package:great_talk/infrastructure/open_ai_client.dart';
import 'package:great_talk/infrastructure/original_dio.dart';
import 'package:great_talk/model/generata_image/generate_image_request/generate_image_request.dart';
import 'package:great_talk/model/generata_image/generate_image_response/generate_image_response.dart';
import 'package:great_talk/repository/result.dart';

class OpenAIRepository {
  final client = OpenAIClient(OriginalDio.withOptions());

  static final instance = OpenAIRepository();

  FutureResult<GenerateImageResponse> generateImage(
      GenerateImageRequest request) async {
    try {
      final response = await client.generateImage(request);
      return Result.success(response);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }
}
