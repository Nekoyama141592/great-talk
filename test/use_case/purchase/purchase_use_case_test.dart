import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/infrastructure/repository/api_repository.dart';
import 'package:great_talk/infrastructure/repository/result/result.dart';
import 'package:great_talk/application/use_case/purchase/purchase_use_case.dart';
import 'package:great_talk/infrastructure/model/rest_api/verify_purchase/verified_purchase.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'purchase_use_case_test.mocks.dart';

@GenerateMocks([ApiRepository, PurchaseDetails])
void main() {
  group('PurchaseUseCase', () {
    late PurchaseUseCase purchaseUseCase;
    late MockApiRepository mockApiRepository;
    late MockPurchaseDetails mockPurchaseDetails;

    setUp(() {
      mockApiRepository = MockApiRepository();
      mockPurchaseDetails = MockPurchaseDetails();
      purchaseUseCase = PurchaseUseCase(mockApiRepository);
    });

    group('verifyPurchase', () {
      late VerifiedPurchase testVerifiedPurchase;

      setUp(() {
        // Create a simple test VerifiedPurchase
        testVerifiedPurchase = VerifiedPurchase(
          purchaseDetails: const {
            'purchaseID': 'test_purchase_id',
            'productID': 'test_product_id',
            'verificationData': {
              'localVerificationData': 'local_data',
              'serverVerificationData': 'server_data',
              'source': 'Test'
            },
            'transactionDate': '2024-01-01T00:00:00.000Z',
            'status': 'purchased',
            'pendingCompletePurchase': false
          },
          verifiedReceipt: const {
            'expires_date': '2025-01-01 00:00:00 Etc/GMT',
            'expires_date_ms': '1735689600000', // Future date
            'expires_date_pst': '2024-12-31 16:00:00 America/Los_Angeles',
            'in_app_ownership_type': 'PURCHASED',
            'is_in_intro_offer_period': 'false',
            'is_trial_period': 'false',
            'original_purchase_date': '2024-01-01 00:00:00 Etc/GMT',
            'original_purchase_date_ms': '1704067200000',
            'original_purchase_date_pst': '2023-12-31 16:00:00 America/Los_Angeles',
            'original_transaction_id': 'original_txn_id',
            'product_id': 'test_product_id',
            'purchase_date': '2024-01-01 00:00:00 Etc/GMT',
            'purchase_date_ms': '1704067200000',
            'purchase_date_pst': '2023-12-31 16:00:00 America/Los_Angeles',
            'quantity': '1',
            'subscription_group_identifier': 'test_group',
            'transaction_id': 'test_txn_id',
            'web_order_line_item_id': 'test_line_item'
          },
          uid: 'test_user_id',
          os: 'iOS',
        );
      });

      test('should call verifyAndroidReceipt when platform is Android', () async {
        when(mockApiRepository.verifyAndroidReceipt(any))
            .thenAnswer((_) async => Result.success(testVerifiedPurchase));
        when(mockApiRepository.verifyIOSReceipt(any))
            .thenAnswer((_) async => Result.success(testVerifiedPurchase));

        final result = await purchaseUseCase.verifyPurchase(mockPurchaseDetails);

        if (Platform.isAndroid) {
          verify(mockApiRepository.verifyAndroidReceipt(mockPurchaseDetails)).called(1);
          verifyNever(mockApiRepository.verifyIOSReceipt(mockPurchaseDetails));
        } else {
          verify(mockApiRepository.verifyIOSReceipt(mockPurchaseDetails)).called(1);
          verifyNever(mockApiRepository.verifyAndroidReceipt(mockPurchaseDetails));
        }

        result.when(
          success: (verifiedPurchase) {
            expect(verifiedPurchase.productId, equals('test_product_id'));
            expect(verifiedPurchase.uid, equals('test_user_id'));
          },
          failure: (error) => fail('Expected success but got failure: $error'),
        );
      });

      test('should call verifyIOSReceipt when platform is iOS', () async {
        when(mockApiRepository.verifyAndroidReceipt(any))
            .thenAnswer((_) async => Result.success(testVerifiedPurchase));
        when(mockApiRepository.verifyIOSReceipt(any))
            .thenAnswer((_) async => Result.success(testVerifiedPurchase));

        final result = await purchaseUseCase.verifyPurchase(mockPurchaseDetails);

        if (!Platform.isAndroid) {
          verify(mockApiRepository.verifyIOSReceipt(mockPurchaseDetails)).called(1);
          verifyNever(mockApiRepository.verifyAndroidReceipt(mockPurchaseDetails));
        } else {
          verify(mockApiRepository.verifyAndroidReceipt(mockPurchaseDetails)).called(1);
          verifyNever(mockApiRepository.verifyIOSReceipt(mockPurchaseDetails));
        }

        result.when(
          success: (verifiedPurchase) {
            expect(verifiedPurchase.productId, equals('test_product_id'));
            expect(verifiedPurchase.uid, equals('test_user_id'));
          },
          failure: (error) => fail('Expected success but got failure: $error'),
        );
      });

      test('should return failure when verification fails', () async {
        const errorMessage = 'Verification failed';
        when(mockApiRepository.verifyAndroidReceipt(any))
            .thenAnswer((_) async => Result.failure(errorMessage));
        when(mockApiRepository.verifyIOSReceipt(any))
            .thenAnswer((_) async => Result.failure(errorMessage));

        final result = await purchaseUseCase.verifyPurchase(mockPurchaseDetails);

        result.when(
          success: (verifiedPurchase) => fail('Expected failure but got success'),
          failure: (error) => expect(error, equals(errorMessage)),
        );
      });

      test('should handle successful verification', () async {
        when(mockApiRepository.verifyAndroidReceipt(any))
            .thenAnswer((_) async => Result.success(testVerifiedPurchase));
        when(mockApiRepository.verifyIOSReceipt(any))
            .thenAnswer((_) async => Result.success(testVerifiedPurchase));

        final result = await purchaseUseCase.verifyPurchase(mockPurchaseDetails);

        result.when(
          success: (verifiedPurchase) {
            expect(verifiedPurchase, isA<VerifiedPurchase>());
            expect(verifiedPurchase.uid, equals('test_user_id'));
            expect(verifiedPurchase.os, equals('iOS'));
          },
          failure: (error) => fail('Expected success but got failure: $error'),
        );
      });
    });

    group('constructor', () {
      test('should create PurchaseUseCase with required dependencies', () {
        final useCase = PurchaseUseCase(mockApiRepository);

        expect(useCase, isA<PurchaseUseCase>());
        expect(useCase.repository, equals(mockApiRepository));
      });
    });

    group('platform-specific behavior', () {
      test('should verify purchase based on current platform', () async {
        final testVerifiedPurchase = VerifiedPurchase(
          purchaseDetails: const {
            'purchaseID': 'cross_platform_purchase_id',
            'productID': 'cross_platform_product',
            'verificationData': {
              'localVerificationData': 'local_data',
              'serverVerificationData': 'server_data',
              'source': 'Test'
            },
            'transactionDate': '2024-01-01T00:00:00.000Z',
            'status': 'purchased',
            'pendingCompletePurchase': false
          },
          verifiedReceipt: const {
            'expires_date': '2025-01-01 00:00:00 Etc/GMT',
            'expires_date_ms': '1735689600000',
            'expires_date_pst': '2024-12-31 16:00:00 America/Los_Angeles',
            'in_app_ownership_type': 'PURCHASED',
            'is_in_intro_offer_period': 'false',
            'is_trial_period': 'false',
            'original_purchase_date': '2024-01-01 00:00:00 Etc/GMT',
            'original_purchase_date_ms': '1704067200000',
            'original_purchase_date_pst': '2023-12-31 16:00:00 America/Los_Angeles',
            'original_transaction_id': 'original_txn_id',
            'product_id': 'cross_platform_product',
            'purchase_date': '2024-01-01 00:00:00 Etc/GMT',
            'purchase_date_ms': '1704067200000',
            'purchase_date_pst': '2023-12-31 16:00:00 America/Los_Angeles',
            'quantity': '1',
            'subscription_group_identifier': 'test_group',
            'transaction_id': 'test_txn_id',
            'web_order_line_item_id': 'test_line_item'
          },
          uid: 'cross_platform_user',
          os: 'iOS',
        );

        // Mock both platform methods
        when(mockApiRepository.verifyAndroidReceipt(any))
            .thenAnswer((_) async => Result.success(testVerifiedPurchase));
        when(mockApiRepository.verifyIOSReceipt(any))
            .thenAnswer((_) async => Result.success(testVerifiedPurchase));

        final result = await purchaseUseCase.verifyPurchase(mockPurchaseDetails);

        // Should call the appropriate method based on current platform
        if (Platform.isAndroid) {
          verify(mockApiRepository.verifyAndroidReceipt(mockPurchaseDetails)).called(1);
          verifyNever(mockApiRepository.verifyIOSReceipt(mockPurchaseDetails));
        } else {
          verify(mockApiRepository.verifyIOSReceipt(mockPurchaseDetails)).called(1);
          verifyNever(mockApiRepository.verifyAndroidReceipt(mockPurchaseDetails));
        }

        result.when(
          success: (verifiedPurchase) {
            expect(verifiedPurchase.productId, equals('cross_platform_product'));
            expect(verifiedPurchase.uid, equals('cross_platform_user'));
          },
          failure: (error) => fail('Expected success but got failure: $error'),
        );
      });
    });
  });
}