import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_ios_receipt_request.freezed.dart';
part 'verify_ios_receipt_request.g.dart';

@freezed
abstract class VerifyIOSReceiptRequest implements _$VerifyIOSReceiptRequest {
  const VerifyIOSReceiptRequest._();
  const factory VerifyIOSReceiptRequest(
      {required String serverVerificationData}) = _VerifyIOSReceiptRequest;
  factory VerifyIOSReceiptRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyIOSReceiptRequestFromJson(json);
}
