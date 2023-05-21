import 'package:freezed_annotation/freezed_annotation.dart';

part 'ios_receipt_response.freezed.dart';
part 'ios_receipt_response.g.dart';

@freezed
abstract class IOSReceiptResponse with _$IOSReceiptResponse {
  const factory IOSReceiptResponse({
    required int responseCode,
    required String message,
  }) = _IOSReceiptResponse;
  factory IOSReceiptResponse.fromJson(Map<String, dynamic> json) =>
      _$IOSReceiptResponseFromJson(json);
}
