import 'package:dio/dio.dart';
import 'package:great_talk/repository/result.dart';
import 'package:great_talk/utility/env_utility.dart';

class WolframRepository {
  FutureResult<String> fetchApi(String query) async {
    Result<String> result = const Result.failure();
    final String wolframAppId = EnvUtility.wolframAppId;
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
