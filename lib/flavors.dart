enum Flavor {
  DEV,
  VERIFICATION,
  PROD,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'Great Talk Dev';
      case Flavor.VERIFICATION:
        return 'Great Talk Verification';
      case Flavor.PROD:
        return 'Great Talk';
      default:
        return 'title';
    }
  }
}
