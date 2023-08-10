import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:great_talk/consts/env_keys.dart';

class AWSS3Utility {
  static String postImagesBucketName() =>
      dotenv.get(EnvKeys.AWS_S3_POST_IMAGES_BUCKET.name);
  static String userImagesBucketName() =>
      dotenv.get(EnvKeys.AWS_S3_USER_IMAGES_BUCKET.name);
}
