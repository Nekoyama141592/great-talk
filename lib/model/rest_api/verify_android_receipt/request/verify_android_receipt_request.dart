import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_android_receipt_request.freezed.dart';
part 'verify_android_receipt_request.g.dart';

@freezed
abstract class VerifyAndroidReceiptRequest
    implements _$VerifyAndroidReceiptRequest {
  const VerifyAndroidReceiptRequest._();
  const factory VerifyAndroidReceiptRequest(
      {required String localVerificationData,
      required String productID}) = _VerifyAndroidReceiptRequest;
  factory VerifyAndroidReceiptRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyAndroidReceiptRequestFromJson(json);
}
