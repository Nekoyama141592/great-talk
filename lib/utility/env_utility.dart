
import 'package:great_talk/env/env_interface.dart';
import 'package:great_talk/env/dev_env.dart';
import 'package:great_talk/env/prod_env.dart';
import 'package:great_talk/flavors.dart';
class EnvUtility {
  EnvInterface get env {
    final flavor = F.appFlavor!;
    switch(flavor) {
      case Flavor.dev:
      return DevEnv();
      case Flavor.prod:
      return ProdEnv();
    }
  }
  String get awsS3AccessKey => env.awsS3AccessKey;

  String get awsS3Bucket => env.awsS3Bucket;

  String get awsS3SecretKey => env.awsS3SecretKey;

  String get apiKey => env.apiKey;

  String get baseUrl => env.baseUrl;

  String get officialAccountUid => env.officialAccountUid;

  String get openAiApiKey => env.openAiApiKey;

  String get verifyIosEndpoint => env.verifyIosEndpoint;

  String get verifyAndroidEndpoint => env.verifyAndroidEndpoint;

  String get wolframAppId => env.wolframAppId;
}