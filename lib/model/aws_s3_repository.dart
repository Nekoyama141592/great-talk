import 'package:flutter/foundation.dart';
import 'package:great_talk/infrastructure/aws_s3/aws_s3_client.dart';
import 'package:great_talk/repository/result.dart';

class AWSS3Repository {
  final client = AWSS3Client();
  FutureResult<Uint8List> getImage(String fileName) async {
    try {
      final stream = await client.getImage(fileName);
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

  FutureResult<String> uploadImage(
      Uint8List uint8list, String newFileName) async {
    try {
      await client.uploadImage(uint8list, newFileName);
      return Result.success(newFileName);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }
}
