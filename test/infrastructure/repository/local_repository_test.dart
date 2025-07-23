import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/infrastructure/model/database_schema/common/moderated_image/moderated_image.dart';
import 'package:great_talk/infrastructure/model/database_schema/common/detected_text/detected_text.dart';
import 'package:great_talk/infrastructure/model/database_schema/post/custom_complete_text/custom_complete_text.dart';
import 'package:great_talk/domain/entity/database/post/post_entity.dart';
import 'package:great_talk/infrastructure/model/local_schema/text_message/text_message.dart';
import 'package:great_talk/infrastructure/model/rest_api/verify_purchase/verified_purchase.dart';
import 'package:great_talk/infrastructure/repository/local_repository.dart';
import 'package:great_talk/infrastructure/model/result/result.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('LocalRepository', () {
    late LocalRepository localRepository;

    setUp(() {
      SharedPreferences.setMockInitialValues({});
    });

    group('VerifiedPurchase operations', () {
      test('should add and fetch verified purchases successfully', () async {
        final prefs = await SharedPreferences.getInstance();
        localRepository = LocalRepository(prefs);

        final testPurchase = VerifiedPurchase(
          purchaseDetails: {
            'productID': 'test_product_id',
            'status': 'purchased',
          },
          verifiedReceipt: {
            'product_id': 'test_product_id',
            'expires_date_ms': '1234567890000',
          },
          uid: 'test_user_id',
          os: 'iOS',
        );

        final result = await localRepository.addVerifiedPurchase(testPurchase);

        expect(result, isA<Success<bool>>());
        result.when(
          success: (value) => expect(value, true),
          failure: (msg) => fail('Expected success but got failure: $msg'),
        );

        final fetchedPurchases = localRepository.fetchVerifiedPurchases();
        expect(fetchedPurchases, hasLength(1));
        expect(fetchedPurchases.first.uid, 'test_user_id');
        expect(fetchedPurchases.first.os, 'iOS');
      });

      test(
        'should return empty list when no verified purchases exist',
        () async {
          final prefs = await SharedPreferences.getInstance();
          localRepository = LocalRepository(prefs);

          final purchases = localRepository.fetchVerifiedPurchases();

          expect(purchases, isEmpty);
        },
      );

      test('should handle multiple verified purchases', () async {
        final prefs = await SharedPreferences.getInstance();
        localRepository = LocalRepository(prefs);

        final purchase1 = VerifiedPurchase(
          purchaseDetails: {'productID': 'product_1'},
          verifiedReceipt: {'product_id': 'product_1'},
          uid: 'user_1',
          os: 'iOS',
        );

        final purchase2 = VerifiedPurchase(
          purchaseDetails: {'productID': 'product_2'},
          verifiedReceipt: {'product_id': 'product_2'},
          uid: 'user_2',
          os: 'Android',
        );

        await localRepository.addVerifiedPurchase(purchase1);
        await localRepository.addVerifiedPurchase(purchase2);

        final purchases = localRepository.fetchVerifiedPurchases();
        expect(purchases, hasLength(2));
        expect(purchases.map((p) => p.uid), containsAll(['user_1', 'user_2']));
      });
    });

    group('Chat log operations', () {
      test('should remove chat log successfully', () async {
        final prefs = await SharedPreferences.getInstance();
        localRepository = LocalRepository(prefs);

        const postId = 'test_post_id';
        await prefs.setString(postId, 'test_chat_data');

        expect(prefs.getString(postId), 'test_chat_data');

        final result = await localRepository.removeChatLog(postId);

        expect(result, isA<Success<bool>>());
        result.when(
          success: (value) => expect(value, true),
          failure: (msg) => fail('Expected success but got failure: $msg'),
        );

        expect(prefs.getString(postId), isNull);
      });

      test(
        'should return success even when removing non-existent chat log',
        () async {
          final prefs = await SharedPreferences.getInstance();
          localRepository = LocalRepository(prefs);

          const postId = 'non_existent_post_id';

          final result = await localRepository.removeChatLog(postId);

          expect(result, isA<Success<bool>>());
        },
      );
    });

    group('First message preferences', () {
      test('should return default need first message when not set', () async {
        final prefs = await SharedPreferences.getInstance();
        localRepository = LocalRepository(prefs);

        final needFirstMessage = localRepository.getNeedFirstMessage();

        expect(needFirstMessage, true);
      });

      test('should set and get need first message preference', () async {
        final prefs = await SharedPreferences.getInstance();
        localRepository = LocalRepository(prefs);

        await localRepository.setNeedFirstMessage(false);
        final needFirstMessage = localRepository.getNeedFirstMessage();

        expect(needFirstMessage, false);
      });
    });

    group('Terms agreement preferences', () {
      test('should return default terms agreement when not set', () async {
        final prefs = await SharedPreferences.getInstance();
        localRepository = LocalRepository(prefs);

        final isAgreed = localRepository.getIsAgreedToTerms();

        expect(isAgreed, false);
      });

      test('should set and get terms agreement preference', () async {
        final prefs = await SharedPreferences.getInstance();
        localRepository = LocalRepository(prefs);

        await localRepository.setIsAgreedToTerms(true);
        final isAgreed = localRepository.getIsAgreedToTerms();

        expect(isAgreed, true);
      });
    });

    group('Image operations', () {
      test('should return null when image does not exist', () async {
        final prefs = await SharedPreferences.getInstance();
        localRepository = LocalRepository(prefs);

        final image = localRepository.getImage('non_existent_image.jpg');

        expect(image, isNull);
      });

      test('should set and get image data', () async {
        final prefs = await SharedPreferences.getInstance();
        localRepository = LocalRepository(prefs);

        const fileName = 'test_image.jpg';
        const imageData = 'base64_encoded_image_data';

        await localRepository.setImage(fileName, imageData);
        final retrievedImage = localRepository.getImage(fileName);

        expect(retrievedImage, imageData);
      });

      test('should update existing image data', () async {
        final prefs = await SharedPreferences.getInstance();
        localRepository = LocalRepository(prefs);

        const fileName = 'test_image.jpg';
        const oldImageData = 'old_image_data';
        const newImageData = 'new_image_data';

        await localRepository.setImage(fileName, oldImageData);
        expect(localRepository.getImage(fileName), oldImageData);

        await localRepository.setImage(fileName, newImageData);
        expect(localRepository.getImage(fileName), newImageData);
      });
    });

    group('Message operations', () {
      PostEntity createTestPost(String postId) {
        return PostEntity(
          postId: postId,
          createdAt: Timestamp.now().toDate(),
          customCompleteText: const CustomCompleteText(
            systemPrompt: 'Complete text',
          ),
          description: const DetectedText(value: 'Test description'),
          image: const ModeratedImage(value: 'test.jpg'),
          title: const DetectedText(value: 'Test Title'),
          uid: 'owner_uid',
          updatedAt: Timestamp.now().toDate(),
          likeCount: 0,
          msgCount: 0,
        );
      }

      test('should return empty list when no messages exist', () async {
        final prefs = await SharedPreferences.getInstance();
        localRepository = LocalRepository(prefs);

        const postId = 'non_existent_post';
        final messages = localRepository.getMessages(postId);

        expect(messages, isEmpty);
      });

      test('should set and get messages successfully', () async {
        final prefs = await SharedPreferences.getInstance();
        localRepository = LocalRepository(prefs);

        const postId = 'test_post_id';
        final testPost = createTestPost(postId);
        final testMessages = [
          TextMessage.user('Hello, this is a test message', 'test_user_id'),
          TextMessage.assistant('Hello! How can I help you?', testPost),
        ];

        await localRepository.setMessages(postId, testMessages);
        final retrievedMessages = localRepository.getMessages(postId);

        expect(retrievedMessages, hasLength(2));
        expect(
          retrievedMessages[0].text.value,
          'Hello, this is a test message',
        );
        expect(retrievedMessages[1].text.value, 'Hello! How can I help you?');
      });

      test('should handle single message', () async {
        final prefs = await SharedPreferences.getInstance();
        localRepository = LocalRepository(prefs);

        const postId = 'single_message_post';
        final testMessage = TextMessage.user(
          'Single test message',
          'test_user_id',
        );

        await localRepository.setMessages(postId, [testMessage]);
        final retrievedMessages = localRepository.getMessages(postId);

        expect(retrievedMessages, hasLength(1));
        expect(retrievedMessages.first.text.value, 'Single test message');
      });

      test('should update existing messages', () async {
        final prefs = await SharedPreferences.getInstance();
        localRepository = LocalRepository(prefs);

        const postId = 'update_test_post';
        final testPost = createTestPost(postId);
        final oldMessages = [TextMessage.user('Old message', 'test_user_id')];

        final newMessages = [
          TextMessage.user('New message 1', 'test_user_id'),
          TextMessage.assistant('New message 2', testPost),
        ];

        await localRepository.setMessages(postId, oldMessages);
        expect(localRepository.getMessages(postId), hasLength(1));

        await localRepository.setMessages(postId, newMessages);
        final updatedMessages = localRepository.getMessages(postId);

        expect(updatedMessages, hasLength(2));
        expect(updatedMessages[0].text.value, 'New message 1');
        expect(updatedMessages[1].text.value, 'New message 2');
      });
    });

    group('Error handling', () {
      test('should handle invalid JSON gracefully in fetchList', () async {
        final prefs = await SharedPreferences.getInstance();
        localRepository = LocalRepository(prefs);

        await prefs.setString('verifiedPurchases', 'invalid_json');

        // Suppress debug print during test
        final originalDebugPrint = debugPrint;
        debugPrint = (String? message, {int? wrapWidth}) {};

        final purchases = localRepository.fetchVerifiedPurchases();

        // Restore original debug print
        debugPrint = originalDebugPrint;

        expect(purchases, isEmpty);
      });

      test('should handle invalid JSON gracefully in getMessages', () async {
        final prefs = await SharedPreferences.getInstance();
        localRepository = LocalRepository(prefs);

        const postId = 'invalid_json_post';
        await prefs.setString(postId, 'invalid_json');

        // Suppress debug print during test
        final originalDebugPrint = debugPrint;
        debugPrint = (String? message, {int? wrapWidth}) {};

        final messages = localRepository.getMessages(postId);

        // Restore original debug print
        debugPrint = originalDebugPrint;

        expect(messages, isEmpty);
      });
    });
  });
}
