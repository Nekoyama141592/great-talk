import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/presentation/page/screen/profile_screen/components/date_text.dart';

void main() {
  group('DateText', () {
    testWidgets('should display formatted dates for both created and updated', (
      WidgetTester tester,
    ) async {
      final createdAt = DateTime(2023, 5, 15);
      final updatedAt = DateTime(2023, 8, 20);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DateText(createdAt: createdAt, updatedAt: updatedAt),
          ),
        ),
      );

      expect(find.text('2023/05/15作成, 2023/08/20更新'), findsOneWidget);
    });

    testWidgets('should handle null createdAt and updatedAt', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: DateText(createdAt: null, updatedAt: null)),
        ),
      );

      expect(find.text('作成, 更新'), findsOneWidget);
    });

    testWidgets('should handle null createdAt with valid updatedAt', (
      WidgetTester tester,
    ) async {
      final updatedAt = DateTime(2023, 12, 25);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: DateText(createdAt: null, updatedAt: updatedAt)),
        ),
      );

      expect(find.text('作成, 2023/12/25更新'), findsOneWidget);
    });

    testWidgets('should handle valid createdAt with null updatedAt', (
      WidgetTester tester,
    ) async {
      final createdAt = DateTime(2023, 1, 1);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: DateText(createdAt: createdAt, updatedAt: null)),
        ),
      );

      expect(find.text('2023/01/01作成, 更新'), findsOneWidget);
    });

    testWidgets(
      'should format dates with zero padding for single digit months and days',
      (WidgetTester tester) async {
        final createdAt = DateTime(2023, 1, 5);
        final updatedAt = DateTime(2023, 9, 8);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DateText(createdAt: createdAt, updatedAt: updatedAt),
            ),
          ),
        );

        expect(find.text('2023/01/05作成, 2023/09/08更新'), findsOneWidget);
      },
    );

    testWidgets('should handle same date for created and updated', (
      WidgetTester tester,
    ) async {
      final sameDate = DateTime(2023, 6, 15);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DateText(createdAt: sameDate, updatedAt: sameDate),
          ),
        ),
      );

      expect(find.text('2023/06/15作成, 2023/06/15更新'), findsOneWidget);
    });

    testWidgets('should handle leap year dates', (WidgetTester tester) async {
      final createdAt = DateTime(2024, 2, 29);
      final updatedAt = DateTime(2024, 2, 29);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DateText(createdAt: createdAt, updatedAt: updatedAt),
          ),
        ),
      );

      expect(find.text('2024/02/29作成, 2024/02/29更新'), findsOneWidget);
    });

    testWidgets('should use correct text style', (WidgetTester tester) async {
      final createdAt = DateTime(2023, 5, 15);
      final updatedAt = DateTime(2023, 8, 20);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DateText(createdAt: createdAt, updatedAt: updatedAt),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.byType(Text));
      expect(textWidget.style?.color, Colors.grey[600]);
    });

    testWidgets('should be a single Text widget', (WidgetTester tester) async {
      final createdAt = DateTime(2023, 5, 15);
      final updatedAt = DateTime(2023, 8, 20);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DateText(createdAt: createdAt, updatedAt: updatedAt),
          ),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
      expect(find.byType(DateText), findsOneWidget);
    });

    testWidgets('should handle year boundaries correctly', (
      WidgetTester tester,
    ) async {
      final createdAt = DateTime(2022, 12, 31);
      final updatedAt = DateTime(2023, 1, 1);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DateText(createdAt: createdAt, updatedAt: updatedAt),
          ),
        ),
      );

      expect(find.text('2022/12/31作成, 2023/01/01更新'), findsOneWidget);
    });

    group('Edge cases', () {
      testWidgets('should handle very old dates', (WidgetTester tester) async {
        final createdAt = DateTime(1900, 1, 1);
        final updatedAt = DateTime(1950, 12, 31);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DateText(createdAt: createdAt, updatedAt: updatedAt),
            ),
          ),
        );

        expect(find.text('1900/01/01作成, 1950/12/31更新'), findsOneWidget);
      });

      testWidgets('should handle future dates', (WidgetTester tester) async {
        final createdAt = DateTime(2030, 6, 15);
        final updatedAt = DateTime(2035, 9, 20);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DateText(createdAt: createdAt, updatedAt: updatedAt),
            ),
          ),
        );

        expect(find.text('2030/06/15作成, 2035/09/20更新'), findsOneWidget);
      });
    });

    group('Theme integration', () {
      testWidgets('should respect theme text style', (
        WidgetTester tester,
      ) async {
        final createdAt = DateTime(2023, 5, 15);
        final updatedAt = DateTime(2023, 8, 20);

        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData(
              textTheme: const TextTheme(bodySmall: TextStyle(fontSize: 10)),
            ),
            home: Scaffold(
              body: DateText(createdAt: createdAt, updatedAt: updatedAt),
            ),
          ),
        );

        final textWidget = tester.widget<Text>(find.byType(Text));
        expect(textWidget.style?.fontSize, 10);
        expect(textWidget.style?.color, Colors.grey[600]);
      });

      testWidgets('should work with dark theme', (WidgetTester tester) async {
        final createdAt = DateTime(2023, 5, 15);
        final updatedAt = DateTime(2023, 8, 20);

        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.dark(),
            home: Scaffold(
              body: DateText(createdAt: createdAt, updatedAt: updatedAt),
            ),
          ),
        );

        expect(find.text('2023/05/15作成, 2023/08/20更新'), findsOneWidget);
        final textWidget = tester.widget<Text>(find.byType(Text));
        expect(textWidget.style?.color, Colors.grey[600]);
      });
    });
  });
}
