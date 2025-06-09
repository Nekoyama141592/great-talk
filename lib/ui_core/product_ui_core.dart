import 'package:great_talk/consts/iap_constants/subscription_constants.dart';

class ProductUiCore {
  static String getPlanName(String productId) {
  String msg = "";
  if (productId == kAnnualSubscriptionId) {
    msg = 'ベーシックプラン（年間）';
  } else if (productId == kMonthSubscriptionId) {
    msg = 'ベーシックプラン';
  } else if (productId == kWeekSubscriptionId) {
    msg = 'ベーシックプラン（週間）';
  } else {
    msg = "プレミアムプラン";
  }

  return msg;
}
}