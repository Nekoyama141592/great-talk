import 'package:great_talk/env/env_interface.dart';
import 'package:great_talk/env/dev_env.dart';
import 'package:great_talk/env/prod_env.dart';
import 'package:great_talk/flavors.dart';

class EnvUtility {
  static EnvInterface get env {
    final flavor = F.appFlavor!;
    switch (flavor) {
      case Flavor.dev:
        return DevEnv();
      case Flavor.prod:
        return ProdEnv();
    }
  }

  static String get awsS3AccessKey => env.awsS3AccessKey;

  static String get awsS3Bucket => env.awsS3Bucket;

  static String get awsS3SecretKey => env.awsS3SecretKey;

  static String get apiKey => env.apiKey;

  static String get baseUrl => env.baseUrl;

  static String get officialAccountUid => env.officialAccountUid;

  static String get openAiApiKey => env.openAiApiKey;

  static String get verifyIosEndpoint => env.verifyIosEndpoint;

  static String get verifyAndroidEndpoint => env.verifyAndroidEndpoint;

  static String get wolframAppId => env.wolframAppId;
}
