import 'package:great_talk/iap_constants/subscription_constants.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

final List<ProductDetails> myProductList = [
  ProductDetails(
      id: kAnnualSubscriptionId,
      title: "年額プラン",
      description: "一年使えます",
      price: "¥6000",
      rawPrice: 6000,
      currencyCode: "JPY",
      currencySymbol: ""),
  ProductDetails(
      id: kMonthSubscriptionId,
      title: "月額プラン",
      description: "一月使えます",
      price: "¥600",
      rawPrice: 600,
      currencyCode: "JPY",
      currencySymbol: ""),
  ProductDetails(
      id: kWeekSubscriptionId,
      title: "週額プラン",
      description: "一週間使えます",
      price: "¥200",
      rawPrice: 200,
      currencyCode: "JPY",
      currencySymbol: "")
];
