import 'package:great_talk/presentation/common/purchase_ui_core.dart';

class ProductUiCore {
  static String getPlanName(String productId) {
    String msg = "";
    if (productId == PurchaseUiCore.kAnnualSubscriptionId) {
      msg = 'ベーシックプラン（年間）';
    } else if (productId == PurchaseUiCore.kMonthSubscriptionId) {
      msg = 'ベーシックプラン';
    } else if (productId == PurchaseUiCore.kWeekSubscriptionId) {
      msg = 'ベーシックプラン（週間）';
    } else {
      msg = "プレミアムプラン";
    }

    return msg;
  }
}
