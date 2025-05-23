import 'package:dio/dio.dart';
import 'package:great_talk/infrastructure/open_ai/original_dio.dart';
import 'package:great_talk/model/rest_api/open_ai/generata_image/generate_image_request/generate_image_request.dart';
import 'package:great_talk/model/rest_api/open_ai/generata_image/generate_image_response/generate_image_response.dart';
import 'package:great_talk/model/rest_api/open_ai/generate_text/generate_text_request/generate_text_response.dart';
import 'package:great_talk/model/rest_api/open_ai/generate_text/generate_text_response/generate_text_request.dart';
import 'package:retrofit/retrofit.dart';

part 'open_ai_client_part.dart';

@RestApi()
abstract class OpenAIClient {
  factory OpenAIClient(OriginalDio dio) = _OpenAIClient;
  @POST("/images/generations")
  Future<GenerateImageResponse> generateImage(
      @Body() GenerateImageRequest request);
  @POST("/chat/completions")
  Future<GenerateTextResponse> generateText(
      @Body() GenerateTextRequest request);
}
