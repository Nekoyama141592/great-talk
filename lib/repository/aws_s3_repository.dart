import 'package:flutter/foundation.dart';
import 'package:great_talk/infrastructure/aws_s3/aws_s3_client.dart';
import 'package:great_talk/repository/result.dart';

class AWSS3Repository {
  final client = AWSS3Client();

  static final instance = AWSS3Repository();
  FutureResult<Uint8List> getObject(String bucketName, String fileName) async {
    try {
      final stream = await client.getObject(bucketName, fileName);
      List<int> memory = [];
      await for (var value in stream) {
        memory.addAll(value);
      }
      final result = Uint8List.fromList(memory);
      return Result.success(result);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<String> putObject(
      Uint8List uint8list, String bucketName, String newFileName) async {
    try {
      await client.putObject(uint8list, bucketName, newFileName);
      return Result.success(newFileName);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<bool> removeObject(String bucketName, String fileName) async {
    try {
      await client.removeObject(bucketName, fileName);
      return const Result.success(true);
    } catch (e) {
      return const Result.failure();
    }
  }
}
