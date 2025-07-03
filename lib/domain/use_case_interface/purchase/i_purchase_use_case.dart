import 'package:great_talk/infrastructure/model/rest_api/verify_purchase/verified_purchase.dart';
import 'package:great_talk/infrastructure/model/result/result.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

/// Abstract interface for purchase verification operations.
/// Handles verifying in-app purchases for both Android and iOS platforms.
abstract class IPurchaseUseCase {
  /// Verifies a purchase receipt based on the platform.
  /// Automatically determines whether to use Android or iOS verification.
  ///
  /// [purchaseDetails] - The purchase details from the in-app purchase
  ///
  /// Returns a FutureResult containing the verified purchase information.
  FutureResult<VerifiedPurchase> verifyPurchase(
    PurchaseDetails purchaseDetails,
  );
}
