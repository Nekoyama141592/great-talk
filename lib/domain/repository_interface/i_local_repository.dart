import 'package:great_talk/infrastructure/model/local_schema/text_message/text_message.dart';
import 'package:great_talk/infrastructure/model/result/result.dart';

abstract class ILocalRepository {
  // Chat operations
  FutureResult<bool> removeChatLog(String postId);
  Future<void> setMessages(String postId, List<TextMessage> messages);
  List<TextMessage> getMessages(String postId);

  // First message preferences
  bool getNeedFirstMessage();
  Future<void> setNeedFirstMessage(bool value);

  // Terms agreement
  bool getIsAgreedToTerms();
  Future<void> setIsAgreedToTerms(bool value);

  // Image caching
  String? getImage(String fileName);
  Future<void> setImage(String fileName, String value);
}
