import 'package:great_talk/app/flavors.dart';

class EnvironmentChecker {
  static bool isProd() => F.appFlavor == Flavor.prod;
}
