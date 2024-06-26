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
        return 'Gretal Dev';
      case Flavor.verification:
        return 'Gretal Verification';
      case Flavor.prod:
        return 'Gretal';
      default:
        return 'title';
    }
  }
}
