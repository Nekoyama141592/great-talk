import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:great_talk/consts/env_keys.dart';

class OriginalDio with DioMixin implements Dio {
  OriginalDio() : super();

  factory OriginalDio.withOptions() {
    const baseUrl = "https://api.openai.com/v1";
    final token = dotenv.get(EnvKeys.OPEN_AI_API_KEY.name);
    final customOptions = BaseOptions(baseUrl: baseUrl, headers: {
      'content-type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    final originalDio = OriginalDio()..options = customOptions;
    return originalDio;
  }

  @override
  HttpClientAdapter get httpClientAdapter => HttpClientAdapter();
}
