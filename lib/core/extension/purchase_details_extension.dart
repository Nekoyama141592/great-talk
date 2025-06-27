import 'package:in_app_purchase/in_app_purchase.dart';

extension PurchaseDetailsExtension on PurchaseDetails {
  Map<String, dynamic> toJson() {
    return {
      "error": _errorMessage(),
      "productID": productID,
      "purchaseID": purchaseID,
      "verificationData": {
        "localVerificationData": verificationData.localVerificationData,
        "serverVerificationData": verificationData.serverVerificationData,
        "source": verificationData.source,
      },
      "transactionDate": transactionDate ?? "",
      "status": status.name,
      "pendingCompletePurchase": pendingCompletePurchase,
    };
  }

  bool get isPurchased =>
      status == PurchaseStatus.purchased || status == PurchaseStatus.restored;
  bool get isPending => status == PurchaseStatus.pending;
  bool get isError => status == PurchaseStatus.error;
  String _errorMessage() => error?.message ?? "";
}
