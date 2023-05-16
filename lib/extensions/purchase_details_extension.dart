import 'dart:io';
import 'package:in_app_purchase/in_app_purchase.dart';

extension PurchaseDetailsExtension on PurchaseDetails {
  Map<String, dynamic> toJson() {
    return {
      "platform": getCurrentPlatform(),
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

  String getCurrentPlatform() {
    if (Platform.isAndroid) {
      return 'Android';
    } else if (Platform.isIOS) {
      return 'iOS';
    } else if (Platform.isMacOS) {
      return 'macOS';
    } else if (Platform.isWindows) {
      return 'Windows';
    } else if (Platform.isLinux) {
      return 'Linux';
    } else if (Platform.isFuchsia) {
      return 'Fuchsia';
    } else {
      return 'Unknown';
    }
  }
}
