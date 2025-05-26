import 'package:dio/dio.dart';

class OriginalDio with DioMixin implements Dio {
  OriginalDio() : super();

  factory OriginalDio.withOptions({
    required String baseUrl,
    required String token,
  }) {
    final customOptions = BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'content-type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    final originalDio = OriginalDio()..options = customOptions;
    return originalDio;
  }

  @override
  HttpClientAdapter get httpClientAdapter => HttpClientAdapter();
}
