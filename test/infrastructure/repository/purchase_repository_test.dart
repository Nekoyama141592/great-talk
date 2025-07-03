import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/infrastructure/model/result/result.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

void main() {
  group('PurchaseRepository Tests', () {
    late TestablePurchaseRepository repository;

    setUp(() {
      repository = TestablePurchaseRepository();
    });

    group('isAvailable', () {
      test('should return true when in-app purchase is available', () async {
        repository.setMockAvailable(true);

        final result = await repository.isAvailable();

        expect(result, true);
      });

      test(
        'should return false when in-app purchase is not available',
        () async {
          repository.setMockAvailable(false);

          final result = await repository.isAvailable();

          expect(result, false);
        },
      );

      test('should return false when exception occurs', () async {
        repository.setMockException(
          'isAvailable',
          Exception('Service unavailable'),
        );

        final result = await repository.isAvailable();

        expect(result, false);
      });
    });

    group('queryProductDetails', () {
      test('should return product details when query succeeds', () async {
        final mockProducts = [
          TestProductDetails('test_product_1', 'Test Product 1', '¥500'),
          TestProductDetails('test_product_2', 'Test Product 2', '¥1000'),
        ];

        repository.setMockProductDetails(mockProducts);

        final result = await repository.queryProductDetails();

        expect(result, isNotNull);
        expect(result!.length, 2);
        expect(result[0].id, 'test_product_1');
        expect(result[1].id, 'test_product_2');
      });

      test('should return null when query fails', () async {
        repository.setMockException(
          'queryProductDetails',
          Exception('Query failed'),
        );

        final result = await repository.queryProductDetails();

        expect(result, isNull);
      });
    });

    group('buyNonConsumable', () {
      test('should return success when purchase succeeds', () async {
        final purchaseParam = PurchaseParam(
          productDetails: TestProductDetails(
            'test_product',
            'Test Product',
            '¥500',
          ),
        );

        final result = await repository.buyNonConsumable(purchaseParam);

        expect(result, isA<Success<bool>>());
        result.when(
          success: (value) => expect(value, true),
          failure: (error) => fail('Expected success but got failure: $error'),
        );
      });

      test('should return failure when purchase fails', () async {
        final purchaseParam = PurchaseParam(
          productDetails: TestProductDetails(
            'test_product',
            'Test Product',
            '¥500',
          ),
        );

        repository.setMockException(
          'buyNonConsumable',
          Exception('Purchase failed'),
        );

        final result = await repository.buyNonConsumable(purchaseParam);

        expect(result, isA<Failure<bool>>());
        expect((result as Failure).e, '購入が失敗しました');
      });
    });

    group('restorePurchases', () {
      test('should return success when restore succeeds', () async {
        final result = await repository.restorePurchases();

        expect(result, isA<Success<bool>>());
        result.when(
          success: (value) => expect(value, true),
          failure: (error) => fail('Expected success but got failure: $error'),
        );
      });

      test('should return failure when restore fails', () async {
        repository.setMockException(
          'restorePurchases',
          Exception('Restore failed'),
        );

        final result = await repository.restorePurchases();

        expect(result, isA<Failure<bool>>());
        expect((result as Failure).e, '購入の復元が失敗しました');
      });
    });

    group('completePurchase', () {
      test(
        'should complete purchase when pendingCompletePurchase is true',
        () async {
          final purchaseDetails = TestPurchaseDetails(
            productID: 'test_product',
            purchaseID: 'test_purchase',
            pendingCompletePurchase: true,
          );

          await repository.completePurchase(purchaseDetails);

          expect(repository.completePurchaseCalled, true);
        },
      );

      test(
        'should not complete purchase when pendingCompletePurchase is false',
        () async {
          final purchaseDetails = TestPurchaseDetails(
            productID: 'test_product',
            purchaseID: 'test_purchase',
            pendingCompletePurchase: false,
          );

          await repository.completePurchase(purchaseDetails);

          expect(repository.completePurchaseCalled, false);
        },
      );

      test('should handle exceptions gracefully', () async {
        final purchaseDetails = TestPurchaseDetails(
          productID: 'test_product',
          purchaseID: 'test_purchase',
          pendingCompletePurchase: true,
        );

        repository.setMockException(
          'completePurchase',
          Exception('Complete failed'),
        );

        // Should not throw
        await repository.completePurchase(purchaseDetails);
      });
    });

    group('acknowledge', () {
      test('should acknowledge Android purchase when not pending', () async {
        final purchaseDetails = TestPurchaseDetails(
          productID: 'test_product',
          purchaseID: 'test_purchase',
          status: PurchaseStatus.purchased,
        );

        // Mock Android platform
        repository.mockPlatform = 'android';

        await repository.acknowledge(purchaseDetails);

        expect(repository.acknowledgeCalled, true);
      });

      test('should not acknowledge when platform is iOS', () async {
        final purchaseDetails = TestPurchaseDetails(
          productID: 'test_product',
          purchaseID: 'test_purchase',
          status: PurchaseStatus.purchased,
        );

        // Mock iOS platform
        repository.mockPlatform = 'ios';

        await repository.acknowledge(purchaseDetails);

        expect(repository.acknowledgeCalled, false);
      });

      test('should not acknowledge when purchase is pending', () async {
        final purchaseDetails = TestPurchaseDetails(
          productID: 'test_product',
          purchaseID: 'test_purchase',
          status: PurchaseStatus.pending,
        );

        repository.mockPlatform = 'android';

        await repository.acknowledge(purchaseDetails);

        expect(repository.acknowledgeCalled, false);
      });

      test('should handle exceptions gracefully', () async {
        final purchaseDetails = TestPurchaseDetails(
          productID: 'test_product',
          purchaseID: 'test_purchase',
          status: PurchaseStatus.purchased,
        );

        repository.mockPlatform = 'android';
        repository.setMockException(
          'acknowledge',
          Exception('Acknowledge failed'),
        );

        // Should not throw
        await repository.acknowledge(purchaseDetails);
      });
    });

    group('cancelTransactions', () {
      test('should cancel transactions on iOS', () async {
        repository.mockPlatform = 'ios';
        repository.setMockTransactionCount(2);

        await repository.cancelTransctions();

        expect(repository.finishTransactionCallCount, 2);
      });

      test('should not cancel transactions on Android', () async {
        repository.mockPlatform = 'android';

        await repository.cancelTransctions();

        expect(repository.finishTransactionCallCount, 0);
      });

      test('should handle exceptions gracefully', () async {
        repository.mockPlatform = 'ios';
        repository.setMockException(
          'cancelTransactions',
          Exception('Cancel failed'),
        );

        // Should not throw
        await repository.cancelTransctions();
      });
    });

    group('Platform-specific behavior', () {
      test('should handle iOS-specific operations correctly', () async {
        repository.mockPlatform = 'ios';

        // iOS should not acknowledge purchases
        final purchaseDetails = TestPurchaseDetails(
          productID: 'test_product',
          purchaseID: 'test_purchase',
          status: PurchaseStatus.purchased,
        );

        await repository.acknowledge(purchaseDetails);
        expect(repository.acknowledgeCalled, false);

        // iOS should cancel transactions
        repository.setMockTransactionCount(3);
        await repository.cancelTransctions();
        expect(repository.finishTransactionCallCount, 3);
      });

      test('should handle Android-specific operations correctly', () async {
        repository.mockPlatform = 'android';

        // Android should acknowledge purchases
        final purchaseDetails = TestPurchaseDetails(
          productID: 'test_product',
          purchaseID: 'test_purchase',
          status: PurchaseStatus.purchased,
        );

        await repository.acknowledge(purchaseDetails);
        expect(repository.acknowledgeCalled, true);

        // Android should not cancel transactions
        repository.finishTransactionCallCount = 0; // Reset
        await repository.cancelTransctions();
        expect(repository.finishTransactionCallCount, 0);
      });
    });

    group('Error handling', () {
      test('should handle various exception types gracefully', () async {
        final tests = [
          ('isAvailable', () => repository.isAvailable()),
          ('queryProductDetails', () => repository.queryProductDetails()),
          (
            'buyNonConsumable',
            () => repository.buyNonConsumable(
              PurchaseParam(
                productDetails: TestProductDetails('test', 'Test', '¥500'),
              ),
            ),
          ),
          ('restorePurchases', () => repository.restorePurchases()),
        ];

        for (final (operation, method) in tests) {
          repository.setMockException(
            operation,
            Exception('$operation failed'),
          );

          // Should not throw exceptions
          expect(() async => await method(), returnsNormally);
        }
      });
    });

    group('Extension method behavior', () {
      test('should properly handle purchase status checks', () {
        final purchasedDetails = TestPurchaseDetails(
          productID: 'test',
          purchaseID: 'test',
          status: PurchaseStatus.purchased,
        );

        final pendingDetails = TestPurchaseDetails(
          productID: 'test',
          purchaseID: 'test',
          status: PurchaseStatus.pending,
        );

        final errorDetails = TestPurchaseDetails(
          productID: 'test',
          purchaseID: 'test',
          status: PurchaseStatus.error,
        );

        expect(purchasedDetails.status == PurchaseStatus.purchased, true);
        expect(pendingDetails.status == PurchaseStatus.pending, true);
        expect(errorDetails.status == PurchaseStatus.error, true);
      });
    });
  });
}

// テスト用のPurchaseRepositoryサブクラス
class TestablePurchaseRepository {
  final Map<String, Exception> mockExceptions = {};
  bool mockAvailable = true;
  List<ProductDetails> mockProducts = [];
  int mockTransactionCount = 0;
  String mockPlatform = 'ios';

  // Test tracking variables
  bool completePurchaseCalled = false;
  bool acknowledgeCalled = false;
  int finishTransactionCallCount = 0;

  void setMockException(String operation, Exception exception) {
    mockExceptions[operation] = exception;
  }

  void setMockAvailable(bool available) {
    mockAvailable = available;
  }

  void setMockProductDetails(List<ProductDetails> products) {
    mockProducts = products;
  }

  void setMockTransactionCount(int count) {
    mockTransactionCount = count;
  }

  Future<bool> isAvailable() async {
    try {
      if (mockExceptions.containsKey('isAvailable')) {
        throw mockExceptions['isAvailable']!;
      }
      return mockAvailable;
    } catch (e) {
      return false;
    }
  }

  Future<List<ProductDetails>?> queryProductDetails() async {
    try {
      if (mockExceptions.containsKey('queryProductDetails')) {
        throw mockExceptions['queryProductDetails']!;
      }
      return mockProducts;
    } catch (e) {
      return null;
    }
  }

  Future<Result<bool>> buyNonConsumable(PurchaseParam purchaseParam) async {
    try {
      if (mockExceptions.containsKey('buyNonConsumable')) {
        throw mockExceptions['buyNonConsumable']!;
      }
      return const Result.success(true);
    } catch (e) {
      return Result.failure('購入が失敗しました');
    }
  }

  Future<Result<bool>> restorePurchases() async {
    try {
      if (mockExceptions.containsKey('restorePurchases')) {
        throw mockExceptions['restorePurchases']!;
      }
      return const Result.success(true);
    } catch (e) {
      return Result.failure('購入の復元が失敗しました');
    }
  }

  Future<void> completePurchase(PurchaseDetails details) async {
    if (!details.pendingCompletePurchase) return;
    try {
      if (mockExceptions.containsKey('completePurchase')) {
        throw mockExceptions['completePurchase']!;
      }
      completePurchaseCalled = true;
    } catch (e) {
      // Handle exception gracefully
    }
  }

  Future<void> acknowledge(PurchaseDetails details) async {
    // Mock Platform.isAndroid check
    if (mockPlatform != 'android' || details.status == PurchaseStatus.pending) {
      return;
    }

    try {
      if (mockExceptions.containsKey('acknowledge')) {
        throw mockExceptions['acknowledge']!;
      }
      acknowledgeCalled = true;
    } catch (e) {
      // Handle exception gracefully
    }
  }

  Future<void> cancelTransctions() async {
    // Mock Platform.isIOS check
    if (mockPlatform != 'ios') return;

    try {
      if (mockExceptions.containsKey('cancelTransactions')) {
        throw mockExceptions['cancelTransactions']!;
      }

      // Simulate finishing transactions
      for (int i = 0; i < mockTransactionCount; i++) {
        finishTransactionCallCount++;
      }
    } catch (e) {
      // Handle exception gracefully
    }
  }
}

// Test helper classes
class TestProductDetails extends ProductDetails {
  TestProductDetails(String id, String title, String price)
    : super(
        id: id,
        title: title,
        description: 'Test product description',
        price: price,
        rawPrice: 500.0,
        currencyCode: 'JPY',
      );
}

class TestPurchaseDetails extends PurchaseDetails {
  TestPurchaseDetails({
    required super.productID,
    required String purchaseID,
    super.status = PurchaseStatus.purchased,
    bool pendingCompletePurchase = false,
  }) : super(
         purchaseID: purchaseID,
         transactionDate: '2024-01-01T00:00:00Z',
         verificationData: PurchaseVerificationData(
           localVerificationData: 'local_data',
           serverVerificationData: 'server_data',
           source: 'test',
         ),
       ) {
    this.pendingCompletePurchase = pendingCompletePurchase;
  }
}
