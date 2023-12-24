import 'package:great_talk/iap_constants/subscription_constants.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

final List<ProductDetails> myProductList = [
  ProductDetails(
      id: kMonthSubscriptionId,
      title: "月額プラン",
      description: "一月使えます",
      price: "¥500",
      rawPrice: 500,
      currencyCode: "JPY",
      currencySymbol: ""),
  ProductDetails(
      id: kPremiumSubscriptionId,
      title: "プレミアムプラン",
      description: "一月使えます",
      price: "¥5000",
      rawPrice: 5000,
      currencyCode: "JPY",
      currencySymbol: ""),
];
