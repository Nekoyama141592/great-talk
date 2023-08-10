import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/consts/env_keys.dart';
import 'package:minio_new/minio.dart';
import 'dart:typed_data';

final minio = Minio(
  endPoint: s3Endpoint,
  region: s3Region,
  accessKey: dotenv.get(EnvKeys.AWS_S3_ACCESS_KEY.name),
  secretKey: dotenv.get(EnvKeys.AWS_S3_SECRET_KEY.name),
);

class AWSS3Client {
  Future<MinioByteStream> getImage(String bucketName, String fileName) async {
    final stream = await minio.getObject(bucketName, fileName);
    return stream;
  }

  Future<void> uploadImage(
      Uint8List uint8List, String bucketName, String newFileName) async {
    Stream<Uint8List> imageBytes = Stream.value(uint8List);
    await minio.putObject(
      bucketName,
      newFileName,
      imageBytes,
    );
  }
}
