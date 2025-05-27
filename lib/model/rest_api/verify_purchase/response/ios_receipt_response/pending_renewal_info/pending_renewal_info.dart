import 'package:freezed_annotation/freezed_annotation.dart';

part 'pending_renewal_info.freezed.dart';
part 'pending_renewal_info.g.dart';

@freezed
abstract class PendingRenewalInfo with _$PendingRenewalInfo {
  const PendingRenewalInfo._();
  const factory PendingRenewalInfo(
      {required String auto_renew_product_id,
      required String auto_renew_status,
      required String original_transaction_id,
      required String product_id}) = _PendingRenewalInfo;
  factory PendingRenewalInfo.fromJson(Map<String, dynamic> json) =>
      _$PendingRenewalInfoFromJson(json);
  bool isAutoRenew() {
    // 1の場合は期限が切れてもサブスクは更新される
    return auto_renew_status == '1';
  }
}
