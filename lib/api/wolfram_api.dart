import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
class WolframApi {
  static Future<String> fetchApi(String query) async {
    final String wolframAppId = dotenv.get("WOLFRAM_APP_ID"); // Wolfram API App IDを設定する
    String wolframApiUrl = 'http://api.wolframalpha.com/v1/spoken?appid=$wolframAppId';
    wolframApiUrl += "&i=${Uri.encodeQueryComponent(query)}";
    final dio = Dio();
    try {
      final response = await dio.get(wolframApiUrl);
      final result = "${response.data.toString()} by Wolfram";
      return result;
    } catch (e) {
      debugPrint(e.toString());
      return 'Error occurred while getting result';
    }
  }

}