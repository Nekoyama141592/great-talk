import 'package:great_talk/repository/result/result.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

/// Abstract interface for in-app purchase operations including
/// product queries, purchase handling, and transaction management.
abstract class IPurchaseRepository {
  /// Cancels pending transactions (iOS only)
  Future<void> cancelTransctions();

  /// Completes a pending purchase
  Future<void> completePurchase(PurchaseDetails details);

  /// Checks if in-app purchases are available on the device
  Future<bool> isAvailable();

  /// Acknowledges a purchase (Android only)
  Future<void> acknowledge(PurchaseDetails details);

  /// Queries available product details for configured product IDs
  Future<List<ProductDetails>?> queryProductDetails();

  /// Initiates a non-consumable purchase
  FutureResult<bool> buyNonConsumable(PurchaseParam purchaseParam);

  /// Restores previous purchases
  FutureResult<bool> restorePurchases();
}