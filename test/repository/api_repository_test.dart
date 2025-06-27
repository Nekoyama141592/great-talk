import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/domain/database_schema/detected_image/detected_image.dart';
import 'package:great_talk/model/rest_api/delete_object/response/delete_object_response.dart';
import 'package:great_talk/model/rest_api/put_object/response/put_object_response.dart';
import 'package:great_talk/model/rest_api/put_object/request/put_object_request.dart';
import 'package:great_talk/model/rest_api/get_object/request/get_object_request.dart';
import 'package:great_talk/model/rest_api/open_ai/generate_image/response/generate_image_response.dart';
import 'package:great_talk/model/rest_api/open_ai/generate_text/request/generate_text_request.dart';
import 'package:great_talk/model/rest_api/open_ai/generate_text/response/generate_text_response.dart';
import 'package:great_talk/model/rest_api/verify_purchase/verified_purchase.dart';
import 'package:great_talk/repository/result/result.dart' as rs;
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:great_talk/extension/purchase_details_extension.dart';

void main() {
  group('ApiRepository Tests', () {
    late TestableApiRepository repository;

    setUp(() {
      repository = TestableApiRepository();
    });

    group('putObject', () {
      test('should return success when upload succeeds', () async {
        final request = PutObjectRequest(
          base64Image: 'base64data',
          object: 'test.jpg',
        );

        final responseData = {'base64Image': 'uploaded_image_data'};

        repository.setMockResponse('putObjectV2', responseData);

        final result = await repository.putObject(request);

        expect(result, isA<rs.Success<PutObjectResponse>>());
        result.when(
          success: (value) {
            expect(value.base64Image, 'uploaded_image_data');
          },
          failure: (error) => fail('Expected success but got failure: $error'),
        );
      });

      test('should return failure when upload fails', () async {
        final request = PutObjectRequest(
          base64Image: 'base64data',
          object: 'test.jpg',
        );

        repository.setMockException('putObjectV2', Exception('Upload failed'));

        final result = await repository.putObject(request);

        expect(result, isA<rs.Failure<PutObjectResponse>>());
        expect((result as rs.Failure).e, '画像のアップロードが失敗しました');
      });
    });

    group('getObject', () {
      test('should return success when download succeeds', () async {
        final request = GetObjectRequest(object: 'test.jpg');

        final responseData = {'base64Image': 'base64imagedata'};

        repository.setMockResponse('getObjectV2', responseData);

        final result = await repository.getObject(request);

        expect(result, isA<rs.Success<String>>());
        result.when(
          success: (value) {
            expect(value, 'base64imagedata');
          },
          failure: (error) => fail('Expected success but got failure: $error'),
        );
      });

      test('should return failure when download fails', () async {
        final request = GetObjectRequest(object: 'test.jpg');

        repository.setMockException(
          'getObjectV2',
          Exception('Download failed'),
        );

        final result = await repository.getObject(request);

        expect(result, isA<rs.Failure<String>>());
        expect((result as rs.Failure).e, '画像の取得が失敗しました');
      });
    });

    group('deleteObject', () {
      test('should return success when deletion succeeds', () async {
        final image = DetectedImage(
          bucketName: 'test-bucket',
          moderationLabels: [],
          moderationModelVersion: '1.0',
          value: 'test.jpg',
        );

        final responseData = {'success': true};

        repository.setMockResponse('deleteObjectV2', responseData);

        final result = await repository.deleteObject(image);

        expect(result, isA<rs.Success<DeleteObjectResponse>>());
      });

      test('should return failure when deletion fails', () async {
        final image = DetectedImage(
          bucketName: 'test-bucket',
          moderationLabels: [],
          moderationModelVersion: '1.0',
          value: 'test.jpg',
        );

        repository.setMockException(
          'deleteObjectV2',
          Exception('Delete failed'),
        );

        final result = await repository.deleteObject(image);

        expect(result, isA<rs.Failure<DeleteObjectResponse>>());
        expect((result as rs.Failure).e, '画像の削除が失敗しました');
      });
    });

    group('generateImage', () {
      test('should return success when image generation succeeds', () async {
        const prompt = 'A beautiful sunset';
        const size = '1024x1024';

        final responseData = {'base64': 'base64encodedimagedata'};

        repository.setMockResponse('generateImage', responseData);

        final result = await repository.generateImage(prompt, size);

        expect(result, isA<rs.Success<GenerateImageResponse?>>());
      });

      test('should return failure when image generation fails', () async {
        const prompt = 'A beautiful sunset';
        const size = '1024x1024';

        repository.setMockException(
          'generateImage',
          Exception('Generation failed'),
        );

        final result = await repository.generateImage(prompt, size);

        expect(result, isA<rs.Failure<GenerateImageResponse?>>());
        expect((result as rs.Failure).e, '画像の生成に失敗しました');
      });
    });

    group('generateText', () {
      test('should return success when text generation succeeds', () async {
        final request = GenerateTextRequest(
          messages: [
            {'role': 'user', 'content': 'Hello'},
          ],
          model: 'gpt-3.5-turbo',
        );

        final responseData = {
          'model': 'gpt-3.5-turbo',
          'content': 'Hello! How can I help you?',
        };

        repository.setMockResponse('generateTextV2', responseData);

        final result = await repository.generateText(request);

        expect(result, isA<rs.Success<GenerateTextResponse>>());
      });

      test('should return failure when text generation fails', () async {
        final request = GenerateTextRequest(
          messages: [
            {'role': 'user', 'content': 'Hello'},
          ],
          model: 'gpt-3.5-turbo',
        );

        repository.setMockException(
          'generateTextV2',
          Exception('Generation failed'),
        );

        final result = await repository.generateText(request);

        expect(result, isA<rs.Failure<GenerateTextResponse>>());
        expect((result as rs.Failure).e, 'テキストの生成に失敗しました');
      });
    });

    group('Error handling', () {
      test('should handle JSON parsing errors gracefully', () async {
        final request = PutObjectRequest(
          base64Image: 'base64data',
          object: 'test.jpg',
        );

        repository.setMockResponse('putObjectV2', 'invalid json');

        final result = await repository.putObject(request);

        expect(result, isA<rs.Failure<PutObjectResponse>>());
        expect((result as rs.Failure).e, '画像のアップロードが失敗しました');
      });

      test('should handle null response data', () async {
        final request = GetObjectRequest(object: 'test.jpg');

        repository.setMockResponse('getObjectV2', null);

        final result = await repository.getObject(request);

        expect(result, isA<rs.Failure<String>>());
        expect((result as rs.Failure).e, '画像の取得が失敗しました');
      });
    });

    group('Function name verification', () {
      test('should call correct Firebase functions', () async {
        final putRequest = PutObjectRequest(
          base64Image: 'base64data',
          object: 'test.jpg',
        );

        final getRequest = GetObjectRequest(object: 'test.jpg');

        final textRequest = GenerateTextRequest(
          messages: [
            {'role': 'user', 'content': 'Hello'},
          ],
          model: 'gpt-3.5-turbo',
        );

        repository.setMockResponse('putObjectV2', {'base64Image': 'data'});
        repository.setMockResponse('getObjectV2', {'base64Image': 'data'});
        repository.setMockResponse('deleteObjectV2', {'success': true});
        repository.setMockResponse('generateImage', {'base64': 'base64data'});
        repository.setMockResponse('generateTextV2', {
          'model': 'gpt-3.5-turbo',
          'content': 'response',
        });

        await repository.putObject(putRequest);
        await repository.getObject(getRequest);
        await repository.deleteObject(
          DetectedImage(
            bucketName: 'bucket',
            moderationLabels: [],
            moderationModelVersion: '1.0',
            value: 'test.jpg',
          ),
        );
        await repository.generateImage('prompt', '1024x1024');
        await repository.generateText(textRequest);

        expect(repository.mockResponses.containsKey('putObjectV2'), true);
        expect(repository.mockResponses.containsKey('getObjectV2'), true);
        expect(repository.mockResponses.containsKey('deleteObjectV2'), true);
        expect(repository.mockResponses.containsKey('generateImage'), true);
        expect(repository.mockResponses.containsKey('generateTextV2'), true);
      });
    });

    group('verifyReceipt', () {
      test('should handle verification success', () async {
        final mockPurchaseDetails = MockPurchaseDetails();

        final responseData = {
          'purchaseDetails': {
            'productID': 'test_product',
            'purchaseID': 'test_purchase_id',
            'transactionDate': '2024-01-01T00:00:00Z',
          },
          'verifiedReceipt': {
            'product_id': 'test_product',
            'transaction_id': 'test_transaction_id',
            'purchase_date_ms': '1704067200000',
            'expires_date_ms': '1736208000000',
          },
          'uid': 'test_user',
          'os': 'iOS',
        };

        repository.setMockResponse('verifyAndroidReceipt', responseData);
        repository.setMockResponse('verifyIOSReceipt', responseData);

        final androidResult = await repository.verifyAndroidReceipt(
          mockPurchaseDetails,
        );
        final iosResult = await repository.verifyIOSReceipt(
          mockPurchaseDetails,
        );

        expect(androidResult, isA<rs.Success<VerifiedPurchase>>());
        expect(iosResult, isA<rs.Success<VerifiedPurchase>>());
      });

      test('should handle verification failure', () async {
        final mockPurchaseDetails = MockPurchaseDetails();

        repository.setMockException(
          'verifyAndroidReceipt',
          Exception('Verification failed'),
        );
        repository.setMockException(
          'verifyIOSReceipt',
          Exception('Verification failed'),
        );

        final androidResult = await repository.verifyAndroidReceipt(
          mockPurchaseDetails,
        );
        final iosResult = await repository.verifyIOSReceipt(
          mockPurchaseDetails,
        );

        expect(androidResult, isA<rs.Failure<VerifiedPurchase>>());
        expect(iosResult, isA<rs.Failure<VerifiedPurchase>>());
        expect((androidResult as rs.Failure).e, '購入の検証が失敗しました');
        expect((iosResult as rs.Failure).e, '購入の検証が失敗しました');
      });
    });
  });
}

// テスト用のApiRepositoryサブクラス
class TestableApiRepository {
  final Map<String, dynamic> mockResponses = {};
  final Map<String, Exception> mockExceptions = {};

  void setMockResponse(String functionName, dynamic response) {
    mockResponses[functionName] = response;
  }

  void setMockException(String functionName, Exception exception) {
    mockExceptions[functionName] = exception;
  }

  Future<Map<String, dynamic>> _call(
    String name,
    Map<String, dynamic> request,
  ) async {
    if (mockExceptions.containsKey(name)) {
      throw mockExceptions[name]!;
    }

    final response = mockResponses[name] ?? {};
    if (response is String || response == null) {
      throw Exception('Invalid response type');
    }
    return response as Map<String, dynamic>;
  }

  rs.FutureResult<PutObjectResponse> putObject(PutObjectRequest request) async {
    try {
      const name = 'putObjectV2';
      final result = await _call(name, request.toJson());
      final res = PutObjectResponse.fromJson(result);
      return rs.Result.success(res);
    } catch (e) {
      return rs.Result.failure('画像のアップロードが失敗しました');
    }
  }

  rs.FutureResult<String> getObject(GetObjectRequest request) async {
    try {
      const name = 'getObjectV2';
      final result = await _call(name, request.toJson());
      final base64Image = result['base64Image'] as String;
      return rs.Result.success(base64Image);
    } catch (e) {
      return rs.Result.failure('画像の取得が失敗しました');
    }
  }

  rs.FutureResult<DeleteObjectResponse> deleteObject(
    DetectedImage image,
  ) async {
    try {
      const name = 'deleteObjectV2';
      final request = {'object': image.value};
      final result = await _call(name, request);
      final res = DeleteObjectResponse.fromJson(result);
      return rs.Result.success(res);
    } catch (e) {
      return rs.Result.failure('画像の削除が失敗しました');
    }
  }

  rs.FutureResult<GenerateImageResponse?> generateImage(
    String prompt,
    String size,
  ) async {
    try {
      const name = 'generateImage';
      final request = {'prompt': prompt, 'size': size};
      final result = await _call(name, request);
      final res = GenerateImageResponse.fromJson(result);
      return rs.Result.success(res);
    } catch (e) {
      return rs.Result.failure('画像の生成に失敗しました');
    }
  }

  rs.FutureResult<GenerateTextResponse> generateText(
    GenerateTextRequest request,
  ) async {
    try {
      const name = 'generateTextV2';
      final requestData = request.toJson();
      final result = await _call(name, requestData);
      final res = GenerateTextResponse.fromJson(result);
      return rs.Result.success(res);
    } catch (e) {
      return rs.Result.failure('テキストの生成に失敗しました');
    }
  }

  rs.FutureResult<VerifiedPurchase> verifyAndroidReceipt(
    PurchaseDetails purchaseDetails,
  ) async {
    try {
      const name = 'verifyAndroidReceipt';
      final request = {'purchaseDetails': purchaseDetails.toJson()};
      final result = await _call(name, request);
      final res = VerifiedPurchase.fromJson(result);
      return rs.Result.success(res);
    } catch (e) {
      return rs.Result.failure('購入の検証が失敗しました');
    }
  }

  rs.FutureResult<VerifiedPurchase> verifyIOSReceipt(
    PurchaseDetails purchaseDetails,
  ) async {
    try {
      const name = 'verifyIOSReceipt';
      final request = {'purchaseDetails': purchaseDetails.toJson()};
      final result = await _call(name, request);
      final res = VerifiedPurchase.fromJson(result);
      return rs.Result.success(res);
    } catch (e) {
      return rs.Result.failure('購入の検証が失敗しました');
    }
  }
}

class MockPurchaseDetails extends PurchaseDetails {
  MockPurchaseDetails()
    : super(
        productID: 'test_product',
        purchaseID: 'test_purchase_id',
        transactionDate: '2024-01-01T00:00:00Z',
        verificationData: PurchaseVerificationData(
          localVerificationData: 'local_data',
          serverVerificationData: 'server_data',
          source: 'test',
        ),
        status: PurchaseStatus.purchased,
      );

  Map<String, dynamic> toJson() {
    return {
      'productID': productID,
      'purchaseID': purchaseID,
      'transactionDate': transactionDate,
    };
  }
}
