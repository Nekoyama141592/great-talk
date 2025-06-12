import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/consts/iap_constants/subscription_constants.dart';
import 'package:great_talk/model/rest_api/verify_purchase/verified_purchase.dart';

part 'purchase_state.freezed.dart';
part 'purchase_state.g.dart';

@freezed
abstract class PurchaseState with _$PurchaseState {
  const PurchaseState._();
  const factory PurchaseState(
      {required List<VerifiedPurchase> verifiedPurchases}) = _PurchaseState;
  factory PurchaseState.fromJson(Map<String, dynamic> json) =>
      _$PurchaseStateFromJson(json);
  bool isSubscribing() => verifiedPurchases.any((e) => e.isValid());
  bool isPremiumSubscribing() =>
      verifiedPurchases
          .where((e) => e.productId == kPremiumSubscriptionId)
          .any((e) => e.isValid());
}
