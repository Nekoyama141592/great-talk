import 'package:great_talk/env/env_interface.dart';
import 'package:great_talk/env/dev_env.dart';
import 'package:great_talk/env/prod_env.dart';
import 'package:great_talk/flavors.dart';

class EnvCore implements EnvInterface {
  EnvInterface get env {
    final flavor = F.appFlavor!;
    switch (flavor) {
      case Flavor.dev:
        return DevEnv();
      case Flavor.prod:
        return ProdEnv();
    }
  }

  @override
  String get apiKey => env.apiKey;

  @override
  String get baseUrl => env.baseUrl;

  @override
  String get openAiApiKey => env.openAiApiKey;
}
