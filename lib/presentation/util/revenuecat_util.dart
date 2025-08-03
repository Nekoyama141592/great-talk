import 'package:great_talk/application/store_config.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class RevenuecatUtil {
  static Future<void> configureSDK() async {
    await Purchases.setLogLevel(LogLevel.debug);
    PurchasesConfiguration configuration;
    if (StoreConfig.isForAmazonAppstore()) {
      configuration =
          AmazonConfiguration(StoreConfig.instance.apiKey)
            ..appUserID = null
            ..purchasesAreCompletedBy =
                const PurchasesAreCompletedByRevenueCat();
    } else {
      configuration =
          PurchasesConfiguration(StoreConfig.instance.apiKey)
            ..appUserID = null
            ..purchasesAreCompletedBy =
                const PurchasesAreCompletedByRevenueCat();
    }
    await Purchases.configure(configuration);
  }
}
