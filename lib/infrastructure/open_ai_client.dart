import 'package:dio/dio.dart';
import 'package:great_talk/infrastructure/original_dio.dart';
import 'package:great_talk/model/generata_image/generate_image_request/generate_image_request.dart';
import 'package:great_talk/model/generata_image/generate_image_response/generate_image_response.dart';
import 'package:retrofit/http.dart';

part 'open_ai_client.g.dart';

@RestApi()
abstract class OpenAIClient {
  factory OpenAIClient(OriginalDio dio) = _OpenAIClient;
  @POST("/images/generations")
  Future<GenerateImageResponse> generateImage(
      @Body() GenerateImageRequest request);
}
