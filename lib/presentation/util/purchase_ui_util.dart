import 'package:great_talk/application/app/flavors.dart';
import 'package:great_talk/domain/entity/purchase/product/product_entity.dart';
import 'package:great_talk/presentation/constant/purchase_constants.dart';

class PurchaseUiUtil {
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

  static List<ProductEntity> mockProProducts() {
    return [
      ProductEntity(
        isPro: true,
        packageId: kMonthSubscriptionId,
        title: PurchaseConstants.proTitle,
        description: "AIとチャットできます",
        price: PurchaseConstants.proPrice,
      ),
    ];
  }

  static List<ProductEntity> mockPremiumProducts() {
    return [
      ProductEntity(
        isPro: false,
        packageId: kPremiumSubscriptionId,
        title: PurchaseConstants.premiumTitle,
        description: "高性能なAIとチャットしたり、画像を生成できたりします",
        price: PurchaseConstants.premiumPrice,
      ),
    ];
  }
}
