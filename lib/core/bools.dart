import 'package:great_talk/flavors.dart';

class EnvironmentChecker {
  static bool isProd() => F.appFlavor == Flavor.prod;
}
