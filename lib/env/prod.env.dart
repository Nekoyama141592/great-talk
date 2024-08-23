// BASE_URL
import 'package:envied/envied.dart';

part 'prod.env.g.dart';

@Envied(path: 'prod.env')
abstract class Env {
  @EnviedField(varName: 'AWS_S3_ACCESS_KEY', obfuscate: true)
  static String get awsS3AccessKey => _Env.awsS3AccessKey;

  @EnviedField(varName: 'AWS_S3_BUCKET', obfuscate: true)
  static String get awsS3Bucket => _Env.awsS3Bucket;

  @EnviedField(varName: 'AWS_S3_SECRET_KEY', obfuscate: true)
  static String get awsS3SecretKey => _Env.awsS3SecretKey;

  @EnviedField(varName: 'API_KEY', obfuscate: true)
  static String get apiKey => _Env.apiKey;

  @EnviedField(varName: 'BASE_URL', obfuscate: true)
  static String get baseUrl => _Env.baseUrl;

  @EnviedField(varName: 'OFFICIAL_ACCOUNT_UID', obfuscate: true)
  static String get officialAccountUid => _Env.officialAccountUid;

  @EnviedField(varName: 'OPEN_AI_API_KEY', obfuscate: true)
  static String get openAiApiKey => _Env.openAiApiKey;

  @EnviedField(varName: 'VERIFY_IOS_ENDPOINT', obfuscate: true)
  static String get verifyIosEndpoint => _Env.verifyIosEndpoint;

  @EnviedField(varName: 'VERIFY_ANDROID_ENDPOINT', obfuscate: true)
  static String get verifyAndroidEndpoint => _Env.verifyAndroidEndpoint;

  @EnviedField(varName: 'WOLFRAM_APP_ID', obfuscate: true)
  static String get wolframAppId => _Env.wolframAppId;
}

