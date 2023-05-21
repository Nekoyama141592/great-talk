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
        return 'すごいAI Dev';
      case Flavor.verification:
        return 'すごいAI Verification';
      case Flavor.prod:
        return 'すごいAI';
      default:
        return 'title';
    }
  }
}
