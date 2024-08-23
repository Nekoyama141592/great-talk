import 'package:great_talk/env/dev.env.dart' as dev;
import 'package:great_talk/env/env_interface.dart';

class DevEnv implements EnvInterface{
  @override
  String get awsS3AccessKey => dev.Env.awsS3AccessKey;
  @override
  String get awsS3Bucket => dev.Env.awsS3Bucket;
  @override
  String get awsS3SecretKey => dev.Env.awsS3SecretKey;
  @override
  String get apiKey => dev.Env.apiKey;
  @override
  String get baseUrl => dev.Env.baseUrl;
  @override
  String get officialAccountUid => dev.Env.officialAccountUid;
  @override
  String get openAiApiKey => dev.Env.openAiApiKey;
  @override
  String get verifyIosEndpoint => dev.Env.verifyIosEndpoint;
  @override
  String get verifyAndroidEndpoint => dev.Env.verifyAndroidEndpoint;
  @override
  String get wolframAppId => dev.Env.wolframAppId;
}