import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:great_talk/infrastructure/cloud_functions/on_call_client.dart';
import 'package:great_talk/model/rest_api/delete_object/request/delete_object_request.dart';
import 'package:great_talk/model/rest_api/delete_object/response/delete_object_response.dart';
import 'package:great_talk/model/rest_api/generate_image/request/generate_image_request.dart';
import 'package:great_talk/model/rest_api/generate_image/response/generate_image_response.dart';
import 'package:great_talk/model/rest_api/get_object/request/get_object_request.dart';
import 'package:great_talk/model/rest_api/get_object/response/get_object_response.dart';
import 'package:great_talk/model/rest_api/put_object/request/put_object_request.dart';
import 'package:great_talk/model/rest_api/put_object/response/put_object_response.dart';
import 'package:great_talk/repository/result.dart';

class OnCallRepository {
  OnCallClient get _client => OnCallClient();

  FutureResult<PutObjectResponse> putObject(PutObjectRequest request) async {
    try {
      const name = 'putObjectV2';
      final result = await _client.call(name, request.toJson());
      final res = PutObjectResponse.fromJson(result);
      return Result.success(res);
    } catch (e) {
      return const Result.failure();
    }
  }

  FutureResult<Uint8List> getObject(GetObjectRequest request) async {
    try {
      const name = 'getObjectV2';
      final result = await _client.call(name, request.toJson());
      final res = GetObjectResponse.fromJson(result);
      final base64Image = res.base64Image;
      final image = base64Decode(base64Image);
      return Result.success(image);
    } catch (e) {
      return const Result.failure();
    }
  }

  FutureResult<DeleteObjectResponse> deleteObject(
      DeleteObjectRequest request) async {
    try {
      const name = 'deleteObjectV2';
      final result = await _client.call(name, request.toJson());
      final res = DeleteObjectResponse.fromJson(result);
      return Result.success(res);
    } catch (e) {
      return const Result.failure();
    }
  }

  Future<GenerateImageResponse?> generateImage(
      String prompt, String size) async {
    try {
      const name = 'generateImage';
      final request = GenerateImageRequest(prompt: prompt, size: size);
      final result = await _client.call(name, request.toJson());
      final res = GenerateImageResponse.fromJson(result);
      return res;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
