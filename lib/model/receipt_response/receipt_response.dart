import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/model/receipt_response/android_receipt_response/android_receipt_response.dart';
import 'package:great_talk/model/receipt_response/ios_receipt_response/ios_receipt_response.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

part 'receipt_response.freezed.dart';
part 'receipt_response.g.dart';

@freezed
abstract class ReceiptResponse implements _$ReceiptResponse {
  const ReceiptResponse._();
  const factory ReceiptResponse({required SDMap latestReceipt}) =
      _ReceiptResponse;
  factory ReceiptResponse.fromJson(Map<String, dynamic> json) =>
      _$ReceiptResponseFromJson(json);
  AndroidReceiptResponse get androidReceipt =>
      AndroidReceiptResponse.fromJson(latestReceipt);
  IOSReceiptResponse get iosReceipt =>
      IOSReceiptResponse.fromJson(latestReceipt);
}
