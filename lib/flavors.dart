enum Flavor {
  dev,
  verification,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Great Talk Dev';
      case Flavor.verification:
        return 'Great Talk Verification';
      case Flavor.prod:
        return 'Great Talk';
      default:
        return 'title';
    }
  }
}
