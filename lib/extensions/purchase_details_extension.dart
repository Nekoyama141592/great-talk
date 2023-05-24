import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:intl/intl.dart';
extension PurchaseDetailsExtension on PurchaseDetails {
  Map<String, dynamic> toJson() {
    return {
      "formattedDate": convertUnixTimeToDate(),
      "productID": productID,
      "purchaseID": purchaseID,
      "verificationData": {
        "localVerificationData": verificationData.localVerificationData,
        "serverVerificationData": verificationData.serverVerificationData,
        "source ": verificationData.source,
      },
      "transactionDate": transactionDate ?? "",
      "status": status.name,
      "pendingCompletePurchase": pendingCompletePurchase,
    };
  }
  String convertUnixTimeToDate() {
    if (transactionDate == null) {
      return "";
    }
    final x = int.parse(transactionDate!);
    final date = DateTime.fromMillisecondsSinceEpoch(x);
    final formattedDate = DateFormat('yyyy-MM-dd').format(date);
    return formattedDate;
  }
}
