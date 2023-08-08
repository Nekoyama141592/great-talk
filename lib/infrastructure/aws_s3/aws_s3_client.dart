import 'dart:io';
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
  Future<MinioByteStream> getImage(String fileName) async {
    final backetName = dotenv.get(EnvKeys.AWS_S3_POST_IMAGES_BUCKET.name);
    final stream = await minio.getObject(backetName, fileName);
    return stream;
  }

  Future<void> uploadImage(File file, String newFileName) async {
    final backetName = dotenv.get(EnvKeys.AWS_S3_POST_IMAGES_BUCKET.name);
    Uint8List uint8List = await file.readAsBytes();
    Stream<Uint8List> imageBytes = Stream.value(uint8List);
    await minio.putObject(
      backetName,
      newFileName,
      imageBytes,
    );
  }
}
