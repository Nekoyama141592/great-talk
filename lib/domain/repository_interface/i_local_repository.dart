import 'package:great_talk/infrastructure/model/local_schema/text_message/text_message.dart';
import 'package:great_talk/infrastructure/model/rest_api/verify_purchase/verified_purchase.dart';
import 'package:great_talk/infrastructure/model/result/result.dart';

/// Abstract interface for local storage operations including
/// preferences, purchases, chat logs, and image caching.
abstract class ILocalRepository {
  // Verified purchases
  FutureResult<bool> addVerifiedPurchase(VerifiedPurchase value);
  List<VerifiedPurchase> fetchVerifiedPurchases();

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
