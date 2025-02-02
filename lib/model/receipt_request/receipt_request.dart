import 'package:freezed_annotation/freezed_annotation.dart';

part 'receipt_request.freezed.dart';
part 'receipt_request.g.dart';

@freezed
abstract class ReceiptRequest implements _$ReceiptRequest {
  const ReceiptRequest._();
  const factory ReceiptRequest({required Map<String, dynamic> data, required String uid}) =
      _ReceiptRequest;
  factory ReceiptRequest.fromJson(Map<String, dynamic> json) =>
      _$ReceiptRequestFromJson(json);
}
