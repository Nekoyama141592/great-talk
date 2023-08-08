import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:great_talk/infrastructure/aws_s3/aws_s3_client.dart';
import 'package:great_talk/repository/result.dart';

class AWSS3Repository {
  final client = AWSS3Client();
  FutureResult<Uint8List> getImage() async {
    try {
      final stream = await client.getImage('logo2.png');
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

  FutureResult<bool> uploadImage(File file, String newFileName) async {
    try {
      await client.uploadImage(file, newFileName);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }
}
