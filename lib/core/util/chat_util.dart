import 'package:great_talk/core/constant/chat_constants.dart';

class ChatUtil {
  static model({required bool isPremiumActive, required bool isProActive}) {
    if (!isPremiumActive && !isProActive) throw Error();
    return isPremiumActive
        ? ChatConstants.premiumModel
        : ChatConstants.proModel;
  }
}
