import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/core/constant/chat_constants.dart';
import 'package:great_talk/presentation/util/purchase_ui_util.dart';
import 'package:great_talk/infrastructure/model/rest_api/verify_purchase/verified_purchase.dart';

part 'purchase_state.freezed.dart';
part 'purchase_state.g.dart';

@freezed
abstract class PurchaseState with _$PurchaseState {
  const PurchaseState._();
  const factory PurchaseState({
    required List<VerifiedPurchase> verifiedPurchases,
  }) = _PurchaseState;
  factory PurchaseState.fromJson(Map<String, dynamic> json) =>
      _$PurchaseStateFromJson(json);
  bool isSubscribing() => verifiedPurchases.any((e) => e.isValid());
  bool isPremiumSubscribing() => verifiedPurchases
      .where((e) => e.productId == PurchaseUiUtil.kPremiumSubscriptionId)
      .any((e) => e.isValid());
  String model() =>
      isPremiumSubscribing()
          ? ChatConstants.proModel
          : ChatConstants.basicModel;
}
