import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/consts/env_keys.dart';
import 'package:minio_new/minio.dart';

class AWSS3Utility {
  static const String _endpoint = 's3-ap-northeast-1.amazonaws.com';
  static const String _region = 'ap-northeast-1';
  // AccessKey
  static String get _accessKey => dotenv.get(EnvKeys.AWS_S3_ACCESS_KEY.name);
  static String get _secretKey => dotenv.get(EnvKeys.AWS_S3_SECRET_KEY.name);
  // minio
  static final minio = Minio(
    endPoint: _endpoint,
    region: _region,
    accessKey: _accessKey,
    secretKey: _secretKey,
  );
  static String get bucketName => dotenv.get(EnvKeys.AWS_S3_BUCKET.name);
  static String _s3FileName() => "${randomString()}.jpg";
  static String profileObject(String uid) => "$uid/profile/${_s3FileName()}";
  static String postObject(String uid) => "$uid/posts/${_s3FileName()}";
}
