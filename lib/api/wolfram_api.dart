import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:great_talk/api/chat_gpt_api.dart';
class WolframApi {
  static Future<String> fetchApi(String msg) async {
    final query = await ChatGPTApi.createWolframQuery(msg);
    final String wolframAppId = dotenv.get("WOLFRAM_APP_ID"); // Wolfram API App IDを設定する
    String wolframApiUrl = 'http://api.wolframalpha.com/v1/spoken?appid=$wolframAppId';
    wolframApiUrl += "&i=${Uri.encodeQueryComponent(query)}";
    final dio = Dio();
    try {
      final response = await dio.get(wolframApiUrl);
      final en = response.data.toString();
      final reqBody = [
        {"role": "system","content": "わかりやすい日本語にして",},
        {"role": "user","content": en,}
      ];
      final result = await ChatGPTApi.fetchApi(reqBody);
      return result;
    } catch (e) {
      debugPrint(e.toString());
      return '計算結果が取得できませんでした';
    }
  }

}