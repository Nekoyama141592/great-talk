import 'package:in_app_purchase/in_app_purchase.dart';

extension PurchaseDetailsExtension on PurchaseDetails {
  Map<String, dynamic> toJson() {
    return {
      "productID": productID,
      "purchaseID": purchaseID,
      "verificationData": {
        "source ": verificationData.source,
      },
      "transactionDate": transactionDate ?? "",
      "status": status.name,
      "pendingCompletePurchase": pendingCompletePurchase,
    };
  }
}
