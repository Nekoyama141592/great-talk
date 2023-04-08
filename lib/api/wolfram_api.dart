import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:great_talk/api/chat_gpt_api.dart';
import 'package:great_talk/common/strings.dart';

class WolframApi {
  static Future<String> fetchApi(String msg) async {
    final query = await ChatGPTApi.createWolframQuery(msg);
    final String wolframAppId =
        dotenv.get("WOLFRAM_APP_ID"); // Wolfram API App IDを設定する
    String wolframApiUrl =
        'http://api.wolframalpha.com/v1/spoken?appid=$wolframAppId';
    wolframApiUrl += "&i=${Uri.encodeQueryComponent(query)}";
    final dio = Dio();
    try {
      final response = await dio.get(wolframApiUrl);
      final en = response.data.toString();
      return en;
    } catch (e) {
      return calculateFailedMsg;
    }
  }

  static List<Map<String, dynamic>> createChatGPTJaReqBody(String en) => [
        {
          "role": "system",
          "content": "わかりやすい日本語にして",
        },
        {
          "role": "user",
          "content": en,
        }
      ];
}
