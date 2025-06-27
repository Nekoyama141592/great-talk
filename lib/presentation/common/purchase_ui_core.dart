import 'package:great_talk/application/app/flavors.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class PurchaseUiCore {
  static bool get _isProd => F.appFlavor == Flavor.prod;

  static String get kWeekSubscriptionId =>
      _isProd ? 'subscription_week' : "dev_subscription_week";

  static String get kMonthSubscriptionId =>
      _isProd ? 'subscription_month' : "dev_subscription_month";

  static String get kAnnualSubscriptionId =>
      _isProd ? 'subscription_annual' : "dev_subscription_annual";

  static String get kPremiumSubscriptionId =>
      _isProd ? 'premium_month' : "dev_premium_month";

  static List<String> get kProductIds => <String>[
    kMonthSubscriptionId,
    kPremiumSubscriptionId,
  ];

  static List<ProductDetails> get mockProductList => [
    ProductDetails(
      id: kMonthSubscriptionId,
      title: "月額プラン",
      description: "一月使えます",
      price: "¥980",
      rawPrice: 500,
      currencyCode: "JPY",
      currencySymbol: "¥",
    ),
    ProductDetails(
      id: kPremiumSubscriptionId,
      title: "プレミアムプラン",
      description: "一月使えます",
      price: "¥3980",
      rawPrice: 5000,
      currencyCode: "JPY",
      currencySymbol: "¥",
    ),
  ];
}
