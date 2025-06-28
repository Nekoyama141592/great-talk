import 'package:great_talk/presentation/util/purchase_ui_util.dart';

class ProductUiUtil {
  static String getPlanName(String productId) {
    String msg = "";
    if (productId == PurchaseUiUtil.kAnnualSubscriptionId) {
      msg = 'ベーシックプラン（年間）';
    } else if (productId == PurchaseUiUtil.kMonthSubscriptionId) {
      msg = 'ベーシックプラン';
    } else if (productId == PurchaseUiUtil.kWeekSubscriptionId) {
      msg = 'ベーシックプラン（週間）';
    } else {
      msg = "プレミアムプラン";
    }

    return msg;
  }
}
