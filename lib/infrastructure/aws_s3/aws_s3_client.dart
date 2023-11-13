import 'package:great_talk/utility/aws_s3_utility.dart';
import 'package:minio_new/minio.dart';
import 'dart:typed_data';

class AWSS3Client {
  Future<MinioByteStream> getObject(String bucketName, String fileName) async {
    final minio = AWSS3Utility.minio;
    final stream = await minio.getObject(bucketName, fileName);
    return stream;
  }

  Future<void> putObject(
      Uint8List uint8List, String bucketName, String newFileName) async {
    Stream<Uint8List> imageBytes = Stream.value(uint8List);
    final minio = AWSS3Utility.minio;
    await minio.putObject(
      bucketName,
      newFileName,
      imageBytes,
    );
  }

  Future<void> removeObject(String bucketName, String fileName) async {
    final minio = AWSS3Utility.minio;
    await minio.removeObject(bucketName, fileName);
  }
}
