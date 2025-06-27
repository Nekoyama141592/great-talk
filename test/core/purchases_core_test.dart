import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/core/util/purchases_core.dart';
import 'package:great_talk/presentation/constant/purchase_constants.dart';

void main() {
  group('PurchasesCore', () {
    group('calculate', () {
      test('should calculate discount percentage correctly', () {
        final result = PurchasesCore.calculate();
        const expectedX =
            PurchaseConstants.annualPrice / (PurchaseConstants.monthPrice * 12);
        const expectedY = 1.0 - expectedX;
        final expectedZ = (expectedY * 100).round();

        expect(result, expectedZ);
        expect(result, isA<int>());
      });

      test('should return discount percentage as integer', () {
        final result = PurchasesCore.calculate();

        expect(result, isA<int>());
        expect(result, greaterThanOrEqualTo(0));
        expect(result, lessThanOrEqualTo(100));
      });

      test('should calculate based on current pricing constants', () {
        final result = PurchasesCore.calculate();
        expect(result, 32);
      });

      test('should be consistent across multiple calls', () {
        final result1 = PurchasesCore.calculate();
        final result2 = PurchasesCore.calculate();
        final result3 = PurchasesCore.calculate();

        expect(result1, equals(result2));
        expect(result2, equals(result3));
        expect(result1, equals(result3));
      });

      test('should represent annual savings percentage', () {
        final discountPercentage = PurchasesCore.calculate();

        final monthlyTotal = PurchaseConstants.monthPrice * 12;
        final annualPrice = PurchaseConstants.annualPrice;
        final savings = monthlyTotal - annualPrice;
        final savingsPercentage = (savings / monthlyTotal * 100).round();

        expect(discountPercentage, savingsPercentage);
      });

      test('should handle precision correctly', () {
        final result = PurchasesCore.calculate();

        // The calculation should handle floating point precision
        // and round to the nearest integer
        expect(result, isA<int>());

        // Verify the intermediate calculation matches expected behavior
        final x =
            PurchaseConstants.annualPrice / (PurchaseConstants.monthPrice * 12);
        final y = 1.0 - x;
        final z = (y * 100).round();

        expect(result, z);
      });
    });

    group('calculation validation', () {
      test('should make economic sense', () {
        final discountPercentage = PurchasesCore.calculate();

        // Discount should be reasonable (between 1% and 50%)
        expect(discountPercentage, greaterThan(0));
        expect(discountPercentage, lessThan(50));

        // Annual plan should be cheaper than monthly
        final monthlyTotal = PurchaseConstants.monthPrice * 12;
        final annualPrice = PurchaseConstants.annualPrice;
        expect(annualPrice, lessThan(monthlyTotal));
      });

      test('should reflect actual pricing structure', () {
        final discountPercentage = PurchasesCore.calculate();

        // With current constants: month=980, annual=7980
        // Monthly total per year: 980 * 12 = 11760
        // Annual price: 7980
        // Savings: 11760 - 7980 = 3780
        // Percentage: 3780 / 11760 * 100 ≈ 32.14% -> rounds to 32%

        expect(discountPercentage, 32);
      });

      test('should work with different precision scenarios', () {
        // This test verifies the rounding behavior
        final result = PurchasesCore.calculate();

        // Calculate step by step to verify rounding
        const monthTotal = PurchaseConstants.monthPrice * 12; // 11760
        const annual = PurchaseConstants.annualPrice; // 7980
        const ratio = annual / monthTotal; // 0.6785714...
        const discount = 1.0 - ratio; // 0.3214285...
        final percentage = (discount * 100).round(); // 32

        expect(result, percentage);
        expect(result, 32);
      });
    });

    group('edge cases', () {
      test('should handle calculation without overflow', () {
        // Ensure no arithmetic overflow occurs
        final result = PurchasesCore.calculate();

        expect(result.isFinite, true);
        expect(result, isA<int>());
        expect(result >= 0, true);
      });

      test('should maintain precision in intermediate calculations', () {
        // Verify that intermediate floating point calculations
        // don't lose significant precision
        final result = PurchasesCore.calculate();

        // Recalculate with high precision
        const x =
            PurchaseConstants.annualPrice / (PurchaseConstants.monthPrice * 12);
        expect(x, closeTo(0.6785714285714286, 0.0000000001));

        const y = 1.0 - x;
        expect(y, closeTo(0.32142857142857145, 0.0000000001));

        final z = (y * 100).round();
        expect(result, z);
      });
    });
  });
}
