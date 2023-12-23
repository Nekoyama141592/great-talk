import 'dart:io';

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
  String get originalTransactionId => Platform.isIOS
      ? iosReceipt.original_transaction_id
      : removeTrailingDots(androidReceipt.orderId);

  String removeTrailingDots(String input) {
    // 正規表現を使用して「..」以降の文字を取り除く
    RegExp regex = RegExp(r'\.\.');
    int matchIndex = regex.firstMatch(input)?.start ?? -1;

    if (matchIndex != -1) {
      // 「..」以降の文字を取り除く
      return input.substring(0, matchIndex);
    } else {
      // 「..」が見つからない場合は元の文字列をそのまま返す
      return input;
    }
  }
}
