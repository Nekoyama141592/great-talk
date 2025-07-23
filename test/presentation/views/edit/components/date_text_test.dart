import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/presentation/page/screen/profile_screen/components/date_text.dart';

void main() {
  group('DateText', () {
    Widget createTestApp(Widget child) {
      return MaterialApp(theme: ThemeData.dark(), home: Scaffold(body: child));
    }

    testWidgets('should display formatted dates for both created and updated', (
      WidgetTester tester,
    ) async {
      final createdAt = DateTime(2023, 5, 15);
      final updatedAt = DateTime(2023, 8, 20);

      await tester.pumpWidget(
        createTestApp(DateText(createdAt: createdAt, updatedAt: updatedAt)),
      );

      expect(find.text('作成日'), findsOneWidget);
      expect(find.text('2023/05/15'), findsOneWidget);
      expect(find.text('更新日'), findsOneWidget);
      expect(find.text('2023/08/20'), findsOneWidget);
    });

    testWidgets('should handle null createdAt and updatedAt', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestApp(const DateText(createdAt: null, updatedAt: null)),
      );

      expect(find.text('作成日'), findsOneWidget);
      expect(find.text('更新日'), findsOneWidget);
      expect(find.text(''), findsAtLeastNWidgets(2));
    });

    testWidgets('should handle null createdAt with valid updatedAt', (
      WidgetTester tester,
    ) async {
      final updatedAt = DateTime(2023, 12, 25);

      await tester.pumpWidget(
        createTestApp(DateText(createdAt: null, updatedAt: updatedAt)),
      );

      expect(find.text('作成日'), findsOneWidget);
      expect(find.text('更新日'), findsOneWidget);
      expect(find.text('2023/12/25'), findsOneWidget);
    });

    testWidgets('should handle valid createdAt with null updatedAt', (
      WidgetTester tester,
    ) async {
      final createdAt = DateTime(2023, 1, 1);

      await tester.pumpWidget(
        createTestApp(DateText(createdAt: createdAt, updatedAt: null)),
      );

      expect(find.text('作成日'), findsOneWidget);
      expect(find.text('2023/01/01'), findsOneWidget);
      expect(find.text('更新日'), findsOneWidget);
    });

    testWidgets(
      'should format dates with zero padding for single digit months and days',
      (WidgetTester tester) async {
        final createdAt = DateTime(2023, 1, 5);
        final updatedAt = DateTime(2023, 9, 8);

        await tester.pumpWidget(
          createTestApp(DateText(createdAt: createdAt, updatedAt: updatedAt)),
        );

        expect(find.text('2023/01/05'), findsOneWidget);
        expect(find.text('2023/09/08'), findsOneWidget);
      },
    );

    testWidgets('should handle same date for created and updated', (
      WidgetTester tester,
    ) async {
      final sameDate = DateTime(2023, 6, 15);

      await tester.pumpWidget(
        createTestApp(DateText(createdAt: sameDate, updatedAt: sameDate)),
      );

      expect(find.text('2023/06/15'), findsAtLeastNWidgets(2));
    });

    testWidgets('should handle leap year dates', (WidgetTester tester) async {
      final createdAt = DateTime(2024, 2, 29);
      final updatedAt = DateTime(2024, 2, 29);

      await tester.pumpWidget(
        createTestApp(DateText(createdAt: createdAt, updatedAt: updatedAt)),
      );

      expect(find.text('2024/02/29'), findsAtLeastNWidgets(2));
    });

    testWidgets('should display container with proper styling', (
      WidgetTester tester,
    ) async {
      final createdAt = DateTime(2023, 5, 15);
      final updatedAt = DateTime(2023, 8, 20);

      await tester.pumpWidget(
        createTestApp(DateText(createdAt: createdAt, updatedAt: updatedAt)),
      );

      expect(find.byType(Container), findsAtLeastNWidgets(1));
      expect(find.byType(DateText), findsOneWidget);
    });

    testWidgets('should handle year boundaries correctly', (
      WidgetTester tester,
    ) async {
      final createdAt = DateTime(2022, 12, 31);
      final updatedAt = DateTime(2023, 1, 1);

      await tester.pumpWidget(
        createTestApp(DateText(createdAt: createdAt, updatedAt: updatedAt)),
      );

      expect(find.text('2022/12/31'), findsOneWidget);
      expect(find.text('2023/01/01'), findsOneWidget);
    });

    group('Edge cases', () {
      testWidgets('should handle very old dates', (WidgetTester tester) async {
        final createdAt = DateTime(1900, 1, 1);
        final updatedAt = DateTime(1950, 12, 31);

        await tester.pumpWidget(
          createTestApp(DateText(createdAt: createdAt, updatedAt: updatedAt)),
        );

        expect(find.text('1900/01/01'), findsOneWidget);
        expect(find.text('1950/12/31'), findsOneWidget);
      });

      testWidgets('should handle future dates', (WidgetTester tester) async {
        final createdAt = DateTime(2030, 6, 15);
        final updatedAt = DateTime(2035, 9, 20);

        await tester.pumpWidget(
          createTestApp(DateText(createdAt: createdAt, updatedAt: updatedAt)),
        );

        expect(find.text('2030/06/15'), findsOneWidget);
        expect(find.text('2035/09/20'), findsOneWidget);
      });
    });

    group('Theme integration', () {
      testWidgets('should respect theme and display icons', (
        WidgetTester tester,
      ) async {
        final createdAt = DateTime(2023, 5, 15);
        final updatedAt = DateTime(2023, 8, 20);

        await tester.pumpWidget(
          createTestApp(DateText(createdAt: createdAt, updatedAt: updatedAt)),
        );

        expect(find.byIcon(Icons.calendar_month_outlined), findsOneWidget);
        expect(find.byIcon(Icons.update_outlined), findsOneWidget);
      });

      testWidgets('should work with dark theme', (WidgetTester tester) async {
        final createdAt = DateTime(2023, 5, 15);
        final updatedAt = DateTime(2023, 8, 20);

        await tester.pumpWidget(
          createTestApp(DateText(createdAt: createdAt, updatedAt: updatedAt)),
        );

        expect(find.text('作成日'), findsOneWidget);
        expect(find.text('更新日'), findsOneWidget);
        expect(find.text('2023/05/15'), findsOneWidget);
        expect(find.text('2023/08/20'), findsOneWidget);
      });
    });
  });
}
