import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/model/ios_latest_receipt/ios_latest_receipt.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

part 'ios_receipt_response.freezed.dart';
part 'ios_receipt_response.g.dart';

@freezed
abstract class IOSReceiptResponse implements _$IOSReceiptResponse {
  const IOSReceiptResponse._();
  const factory IOSReceiptResponse({
    required int responseCode,
    required String message,
    SDMap? latestReceipt
  }) = _IOSReceiptResponse;
  factory IOSReceiptResponse.fromJson(Map<String, dynamic> json) =>
      _$IOSReceiptResponseFromJson(json);
  IOSLatestReceipt? get typedReceipt => latestReceipt != null ? IOSLatestReceipt.fromJson(latestReceipt!) : null;
}
