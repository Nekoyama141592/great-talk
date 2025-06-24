import 'package:flutter_test/flutter_test.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:great_talk/extension/purchase_details_extension.dart';

class TestPurchaseDetails extends PurchaseDetails {
  TestPurchaseDetails({
    required super.productID,
    super.purchaseID,
    super.status = PurchaseStatus.purchased,
    super.transactionDate,
    IAPError? error,
    bool pendingCompletePurchase = false,
  }) : super(
          verificationData: PurchaseVerificationData(
            localVerificationData: 'local_data',
            serverVerificationData: 'server_data',
            source: 'test_source',
          ),
        ) {
    this.pendingCompletePurchase = pendingCompletePurchase;
    if (error != null) {
      this.error = error;
    }
  }
}

void main() {
  group('PurchaseDetailsExtension', () {
    group('toJson', () {
      test('should return correct JSON structure for purchased status', () {
        final purchaseDetails = TestPurchaseDetails(
          productID: 'test_product',
          purchaseID: 'test_purchase_id',
          transactionDate: '2023-01-01',
          status: PurchaseStatus.purchased,
        );

        final json = purchaseDetails.toJson();

        expect(json, {
          'error': '',
          'productID': 'test_product',
          'purchaseID': 'test_purchase_id',
          'verificationData': {
            'localVerificationData': 'local_data',
            'serverVerificationData': 'server_data',
            'source': 'test_source',
          },
          'transactionDate': '2023-01-01',
          'status': PurchaseStatus.purchased.name,
          'pendingCompletePurchase': false,
        });
      });

      test('should return empty string for transactionDate when null', () {
        final purchaseDetails = TestPurchaseDetails(
          productID: 'test_product',
          purchaseID: 'test_purchase_id',
          transactionDate: null,
          status: PurchaseStatus.purchased,
        );

        final json = purchaseDetails.toJson();

        expect(json['transactionDate'], '');
      });

      test('should return error message when error exists', () {
        final error = IAPError(
          source: 'AppStore',
          code: 'error_code',
          message: 'Purchase failed',
          details: {},
        );
        final purchaseDetails = TestPurchaseDetails(
          productID: 'test_product',
          purchaseID: 'test_purchase_id',
          transactionDate: '2023-01-01',
          status: PurchaseStatus.error,
          error: error,
        );

        final json = purchaseDetails.toJson();

        expect(json['error'], 'Purchase failed');
      });
    });

    group('isPurchased', () {
      test('should return true for purchased status', () {
        final purchaseDetails = TestPurchaseDetails(
          productID: 'test_product',
          purchaseID: 'test_purchase_id',
          transactionDate: '2023-01-01',
          status: PurchaseStatus.purchased,
        );

        expect(purchaseDetails.isPurchased, true);
      });

      test('should return true for restored status', () {
        final purchaseDetails = TestPurchaseDetails(
          productID: 'test_product',
          purchaseID: 'test_purchase_id',
          transactionDate: '2023-01-01',
          status: PurchaseStatus.restored,
        );

        expect(purchaseDetails.isPurchased, true);
      });

      test('should return false for pending status', () {
        final purchaseDetails = TestPurchaseDetails(
          productID: 'test_product',
          purchaseID: 'test_purchase_id',
          transactionDate: '2023-01-01',
          status: PurchaseStatus.pending,
        );

        expect(purchaseDetails.isPurchased, false);
      });

      test('should return false for error status', () {
        final purchaseDetails = TestPurchaseDetails(
          productID: 'test_product',
          purchaseID: 'test_purchase_id',
          transactionDate: '2023-01-01',
          status: PurchaseStatus.error,
        );

        expect(purchaseDetails.isPurchased, false);
      });
    });

    group('isPending', () {
      test('should return true for pending status', () {
        final purchaseDetails = TestPurchaseDetails(
          productID: 'test_product',
          purchaseID: 'test_purchase_id',
          transactionDate: '2023-01-01',
          status: PurchaseStatus.pending,
        );

        expect(purchaseDetails.isPending, true);
      });

      test('should return false for non-pending status', () {
        final purchaseDetails = TestPurchaseDetails(
          productID: 'test_product',
          purchaseID: 'test_purchase_id',
          transactionDate: '2023-01-01',
          status: PurchaseStatus.purchased,
        );

        expect(purchaseDetails.isPending, false);
      });
    });

    group('isError', () {
      test('should return true for error status', () {
        final purchaseDetails = TestPurchaseDetails(
          productID: 'test_product',
          purchaseID: 'test_purchase_id',
          transactionDate: '2023-01-01',
          status: PurchaseStatus.error,
        );

        expect(purchaseDetails.isError, true);
      });

      test('should return false for non-error status', () {
        final purchaseDetails = TestPurchaseDetails(
          productID: 'test_product',
          purchaseID: 'test_purchase_id',
          transactionDate: '2023-01-01',
          status: PurchaseStatus.purchased,
        );

        expect(purchaseDetails.isError, false);
      });
    });
  });
}