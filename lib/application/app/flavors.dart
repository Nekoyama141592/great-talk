enum Flavor { dev, verification, prod }

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'ShareAI Dev';
      case Flavor.verification:
        return 'ShareAI Verification';
      case Flavor.prod:
        return 'ShareAI';
    }
  }
}
