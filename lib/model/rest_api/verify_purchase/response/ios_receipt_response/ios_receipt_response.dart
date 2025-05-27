import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/model/rest_api/verify_purchase/response/ios_receipt_response/pending_renewal_info/pending_renewal_info.dart';
part 'ios_receipt_response.freezed.dart';
part 'ios_receipt_response.g.dart';

@freezed
abstract class IOSReceiptResponse with _$IOSReceiptResponse {
  const IOSReceiptResponse._();
  const factory IOSReceiptResponse(
      {required String expires_date,
      required String expires_date_ms,
      required String expires_date_pst,
      required String in_app_ownership_type,
      required String is_in_intro_offer_period,
      required String is_trial_period,
      required String original_purchase_date,
      required String original_purchase_date_ms,
      required String original_purchase_date_pst,
      required String original_transaction_id,
      required String product_id,
      required String purchase_date,
      required String purchase_date_ms,
      required String purchase_date_pst,
      required String quantity,
      required String subscription_group_identifier,
      required String transaction_id,
      required String web_order_line_item_id,
      Map<String, dynamic>? pendingRenewalInfo}) = _IOSReceiptResponse;
  factory IOSReceiptResponse.fromJson(Map<String, dynamic> json) =>
      _$IOSReceiptResponseFromJson(json);
  PendingRenewalInfo? typedPendingRenewalInfo() {
    if (pendingRenewalInfo == null) return null;
    return PendingRenewalInfo.fromJson(pendingRenewalInfo!);
  }
}
