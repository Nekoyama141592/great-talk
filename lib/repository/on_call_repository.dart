import 'package:great_talk/infrastructure/cloud_functions/on_call_client.dart';
import 'package:great_talk/model/rest_api/put_object/request/put_object_request.dart';
import 'package:great_talk/model/rest_api/put_object/response/put_object_response.dart';
import 'package:great_talk/repository/result.dart';

abstract class OnCallRepository {
  OnCallClient get _client => OnCallClient();

  FutureResult<PutObjectResponse> putObject(PutObjectRequest request) async {
    try {
      const name = 'putObjectV2';
      final result = await _client.call(name, request.toJson());
      final res = PutObjectResponse.fromJson(result);
      return Result.success(res);
    } catch(e) {
      return const Result.failure();
    }
  }
}
