import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:great_talk/repository/result.dart';

class WolframRepository {
  FutureResult<String> fetchApi(String query) async {
    Result<String> result = const Result.failure();
    final String wolframAppId =
        dotenv.get("WOLFRAM_APP_ID"); // Wolfram API App IDを設定する
    String wolframApiUrl =
        'http://api.wolframalpha.com/v1/spoken?appid=$wolframAppId';
    wolframApiUrl += "&i=${Uri.encodeQueryComponent(query)}";
    final dio = Dio();
    try {
      final response = await dio.get(wolframApiUrl);
      final en = response.data.toString();
      result = Result.success(en);
    } catch (e) {
      result = const Result.failure();
    }
    return result;
  }
}
