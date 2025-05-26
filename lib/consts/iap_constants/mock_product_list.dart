import 'package:great_talk/consts/iap_constants/subscription_constants.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

final List<ProductDetails> mockProductList = [
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
