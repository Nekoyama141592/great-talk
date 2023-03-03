// packages
import 'package:great_talk/iap_constants/subscription_constants.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

String randomString() {
  const uuid = Uuid();
  return uuid.v4();
}

String getName(types.User person) => person.lastName ?? 'UNKNOWN';

// prefs_key
const lastChatDatePrefsKey = "lastChatDate";
const chatCountPrefsKey = "chatCount";

String getPlanDescription(ProductDetails productDetails) {
  String msg = "";
  switch(productDetails.id) {
    case(kAnnualSubscriptionId):
    msg = "1年";
    break;
    case(kMonthSubscriptionId):
    msg = "1ヶ月";
    break;
    case(kWeekSubscriptionId):
    msg = "1週間";
    break;
  }
  msg += "あたり${productDetails.price}です。";
  return msg;
}

String getPlanName(ProductDetails productDetails) {
  String msg = "";
  switch(productDetails.id) {
    case(kAnnualSubscriptionId):
    msg = "年額";
    break;
    case(kMonthSubscriptionId):
    msg = "月額";
    break;
    case(kWeekSubscriptionId):
    msg = "週額";
    break;
  }
  msg += "プラン";
  return msg;
}

const String clearChatMsg = "チャット履歴を全て削除しました";