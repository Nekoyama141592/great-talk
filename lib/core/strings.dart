// packages
import 'package:great_talk/flavors.dart';
import 'package:great_talk/model/chat_user_metadata/chat_user_metadata.dart';
import 'package:great_talk/consts/iap_constants/subscription_constants.dart';
import 'package:uuid/uuid.dart';

String randomString() {
  const uuid = Uuid();
  return uuid.v4();
}

final appName = F.title;

String getPlanName(String productId) {
  String msg = "";
  if (productId == kAnnualSubscriptionId) {
    msg = 'ベーシックプラン（年間）';
  } else if (productId == kMonthSubscriptionId) {
    msg = 'ベーシックプラン';
  } else if (productId == kWeekSubscriptionId) {
    msg = 'ベーシックプラン（週間）';
  } else {
    msg = "プレミアムプラン";
  }

  return msg;
}

String? mapMetadataToLastAnswer(Map<String, dynamic>? mapMetadata) =>
    mapMetadata == null
        ? null
        : ChatUserMetadata.fromJson(mapMetadata).lastAnswer;
// msg
const String clearChatMsg = "チャット履歴を全て削除しました";
const String calculateFailedMsg = '計算結果が取得できませんでした';
const String wrongInfoMsg = """
注意
AIからの返事は誤った内容が含まれることがあります。
あくまでエンターテイメントとしてご利用ください。
ご理解のほどよろしくお願いいたします。

また、利用規約とプライバシーポリシーもご確認ください。
""";
// text
const String tosText = "利用規約";
const String privacyPolicyText = "プライバシーポリシー";
const String agreeText = "上記の内容、利用規約、プライバシーポリシーに同意する";

const String okText = "OK";
const String cancelText = "キャンセル";
// initialName
const noName = "名無し";
