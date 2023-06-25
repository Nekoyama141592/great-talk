import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:great_talk/repository/chat_gpt_repository.dart';
import 'package:great_talk/repository/result.dart';

class WolframRepository {
  static FutureResult<String> fetchApi(String msg) async {
    final query = await ChatGPTRepository.createWolframQuery(msg);
    final String wolframAppId =
        dotenv.get("WOLFRAM_APP_ID"); // Wolfram API App IDを設定する
    String wolframApiUrl =
        'http://api.wolframalpha.com/v1/spoken?appid=$wolframAppId';
    wolframApiUrl += "&i=${Uri.encodeQueryComponent(query)}";
    final dio = Dio();
    try {
      final response = await dio.get(wolframApiUrl);
      final en = response.data.toString();
      return Result.success(en);
    } catch (e) {
      return const Result.failure();
    }
  }
}
