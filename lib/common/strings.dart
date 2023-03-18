// packages
import 'package:great_talk/domain/chat_user_metadata/chat_user_metadata.dart';
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
// personIdで各々のChat履歴
const lastChatDatePrefsKey = "lastChatDate";
const chatCountPrefsKey = "chatCount";
const isAgreedToTermsPrefsKey = "isAgreedToTerms";
const localPersonsPrefsKey = "localPersons";
String getPlanDescription(String productID,String price) {
  String msg = "";
  switch(productID) {
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
  msg += "あたり$priceです。";
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
String mapMetadataToLastAnswer(Map<String,dynamic> mapMetadata) => ChatUserMetadata.fromJson(mapMetadata).lastAnswer;
const String appName = "偉人talk";
// msg
const String clearChatMsg = "チャット履歴を全て削除しました";
const String calculateFailedMsg = '計算結果が取得できませんでした';
const String wrongInfoMsg = """
注意
AIからの返事は誤った内容が含まれることがあります。
あくまでエンターテイメントとしてご利用ください。
ご理解のほどよろしくお願いいたします。
""";
// text
const String tosText = "利用規約";
const String agreeText = "同意する";