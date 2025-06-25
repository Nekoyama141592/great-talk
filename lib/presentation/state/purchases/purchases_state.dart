import 'package:great_talk/model/rest_api/verify_purchase/verified_purchase.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class PurchasesState {
  final List<VerifiedPurchase> verifiedPurchases;
  final List<ProductDetails> products;
  final bool storeConnected;

  PurchasesState({
    List<VerifiedPurchase>? verifiedPurchases,
    List<ProductDetails>? products,
    bool? storeConnected,
  }) : verifiedPurchases = verifiedPurchases ?? [],
       products = products ?? [],
       storeConnected = storeConnected ?? false;

  PurchasesState copyWith({
    List<VerifiedPurchase>? verifiedPurchases,
    List<ProductDetails>? products,
    bool? storeConnected,
  }) {
    return PurchasesState(
      verifiedPurchases: verifiedPurchases ?? this.verifiedPurchases,
      products: products ?? this.products,
      storeConnected: storeConnected ?? this.storeConnected,
    );
  }

  bool isPurchased(String productID) {
    return verifiedPurchases.any(
      (e) => e.isValid() && productID == e.typedPurchaseDetails().productID,
    );
  }
}
