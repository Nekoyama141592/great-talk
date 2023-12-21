import 'package:freezed_annotation/freezed_annotation.dart';

part 'android_receipt_response.freezed.dart';
part 'android_receipt_response.g.dart';

@freezed
abstract class AndroidReceiptResponse implements _$AndroidReceiptResponse {
  const AndroidReceiptResponse._();
  const factory AndroidReceiptResponse(
      {required int acknowledgementState,
      required bool autoRenewing,
      required String countryCode,
      required String developerPayload,
      required String expiryTimeMillis,
      required String kind,
      required String orderId,
      required int paymentState,
      required String priceAmountMicros,
      required String priceCurrencyCode,
      required int purchaseType,
      required String startTimeMillis}) = _AndroidReceiptResponse;
  factory AndroidReceiptResponse.fromJson(Map<String, dynamic> json) =>
      _$AndroidReceiptResponseFromJson(json);
}
