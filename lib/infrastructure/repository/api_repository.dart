import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:great_talk/core/util/json_util.dart';
import 'package:great_talk/infrastructure/model/rest_api/delete_object/request/delete_object_request.dart';
import 'package:great_talk/infrastructure/model/rest_api/delete_object/response/delete_object_response.dart';
import 'package:great_talk/infrastructure/model/rest_api/open_ai/generate_image/request/generate_image_request.dart';
import 'package:great_talk/infrastructure/model/rest_api/open_ai/generate_image/response/generate_image_response.dart';
import 'package:great_talk/infrastructure/model/rest_api/get_object/request/get_object_request.dart';
import 'package:great_talk/infrastructure/model/rest_api/get_object/response/get_object_response.dart';
import 'package:great_talk/infrastructure/model/rest_api/open_ai/generate_text/request/generate_text_request.dart';
import 'package:great_talk/infrastructure/model/rest_api/open_ai/generate_text/response/generate_text_response.dart';
import 'package:great_talk/infrastructure/model/rest_api/put_object/request/put_object_request.dart';
import 'package:great_talk/infrastructure/model/rest_api/put_object/response/put_object_response.dart';
import 'package:great_talk/infrastructure/model/result/result.dart' as rs;
import 'package:great_talk/domain/repository_interface/i_api_repository.dart';

class ApiRepository implements IApiRepository {
  ApiRepository(this.client);
  final FirebaseFunctions client;

  HttpsCallable _httpsCallable(String functionName) => client.httpsCallable(
    functionName,
    options: HttpsCallableOptions(timeout: const Duration(seconds: 300)),
  );
  Future<Map<String, dynamic>> _call(
    String name,
    Map<String, dynamic> request,
  ) async {
    final callable = _httpsCallable(name);
    final result = await callable.call(request);
    final data = result.data;
    final decoded = JsonUtil.cast(data);
    return decoded;
  }

  @override
  rs.FutureResult<PutObjectResponse> putObject(
    String base64Image,
    String object,
  ) async {
    try {
      const name = 'putObjectV2';
      final request = PutObjectRequest(
        base64Image: base64Image,
        object: object,
      );
      final result = await _call(name, request.toJson());
      final res = PutObjectResponse.fromJson(result);
      return rs.Result.success(res);
    } on FirebaseFunctionsException catch (e) {
      debugPrint('putObject: ${e.toString()}');
      return const rs.Result.failure('画像のアップロードが失敗しました');
    }
  }

  @override
  rs.FutureResult<String> getObject(String object) async {
    try {
      const name = 'getObjectV2';
      final request = GetObjectRequest(object: object);
      final result = await _call(name, request.toJson());
      final res = GetObjectResponse.fromJson(result);
      final base64Image = res.base64Image;
      return rs.Result.success(base64Image);
    } on FirebaseFunctionsException catch (e) {
      debugPrint('getObject: ${e.toString()}');
      return const rs.Result.failure('画像の取得が失敗しました');
    }
  }

  @override
  rs.FutureResult<DeleteObjectResponse> deleteObject(String object) async {
    try {
      const name = 'deleteObjectV2';
      final request = DeleteObjectRequest(object: object);
      final result = await _call(name, request.toJson());
      final res = DeleteObjectResponse.fromJson(result);
      debugPrint('画像の削除が成功しました');
      return rs.Result.success(res);
    } on FirebaseFunctionsException catch (e) {
      debugPrint('deleteObject: ${e.toString()}');
      return const rs.Result.failure('画像の削除が失敗しました');
    }
  }

  @override
  rs.FutureResult<GenerateImageResponse?> generateImage(
    String prompt,
    String size,
  ) async {
    try {
      const name = 'generateImage';
      final request = GenerateImageRequest(prompt: prompt, size: size);
      final result = await _call(name, request.toJson());
      final res = GenerateImageResponse.fromJson(result);
      return rs.Result.success(res);
    } on FirebaseFunctionsException catch (e) {
      debugPrint('generateImage: ${e.toString()}');
      return const rs.Result.failure('画像の生成に失敗しました');
    }
  }

  @override
  rs.FutureResult<GenerateTextResponse> generateText(
    String model,
    List<Map<String, dynamic>> messages,
  ) async {
    try {
      const name = 'generateTextV2';
      final request = GenerateTextRequest(model: model, messages: messages);
      final requestData = request.toJson();
      final result = await _call(name, requestData);
      final res = GenerateTextResponse.fromJson(result);
      return rs.Result.success(res);
    } on FirebaseFunctionsException catch (e) {
      debugPrint('generateText: ${e.toString()}');
      return const rs.Result.failure('テキストの生成に失敗しました');
    }
  }
  rs.FutureResult<Map<String, dynamic>> updateUser(
    String base64,
    String bio,
    String userName,
  ) async {
    try {
      const name = 'updateUser';
      final requestData = {
        "base64Image": base64,
        "bio": bio,
        "userName": userName,
      };
      final result = await _call(name, requestData);
      final res = result;
      print(res);
      return rs.Result.success(res);
    } on FirebaseFunctionsException catch (e) {
      debugPrint('updateUser: ${e.toString()}');
      return const rs.Result.failure('テキストの生成に失敗しました');
    }
  }
}
