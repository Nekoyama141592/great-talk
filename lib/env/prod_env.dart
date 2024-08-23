import 'package:great_talk/env/prod.env.dart' as prod;
import 'package:great_talk/env/env_interface.dart';

class ProdEnv implements EnvInterface {
  @override
  String get awsS3AccessKey => prod.Env.awsS3AccessKey;
  @override
  String get awsS3Bucket => prod.Env.awsS3Bucket;
  @override
  String get awsS3SecretKey => prod.Env.awsS3SecretKey;
  @override
  String get apiKey => prod.Env.apiKey;
  @override
  String get baseUrl => prod.Env.baseUrl;
  @override
  String get officialAccountUid => prod.Env.officialAccountUid;
  @override
  String get openAiApiKey => prod.Env.openAiApiKey;
  @override
  String get verifyIosEndpoint => prod.Env.verifyIosEndpoint;
  @override
  String get verifyAndroidEndpoint => prod.Env.verifyAndroidEndpoint;
  @override
  String get wolframAppId => prod.Env.wolframAppId;
}