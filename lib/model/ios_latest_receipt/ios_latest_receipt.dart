import 'package:freezed_annotation/freezed_annotation.dart';

part 'ios_latest_receipt.freezed.dart';
part 'ios_latest_receipt.g.dart';

@freezed
abstract class IOSLatestReceipt implements _$IOSLatestReceipt {
  const IOSLatestReceipt._();
  const factory IOSLatestReceipt({
    required String product_id,
    required String expires_date_ms
  }) = _IOSLatestReceipt;
  factory IOSLatestReceipt.fromJson(Map<String, dynamic> json) =>
      _$IOSLatestReceiptFromJson(json);
}
