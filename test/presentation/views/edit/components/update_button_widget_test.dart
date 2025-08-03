import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/presentation/page/edit/components/update_button_widget.dart';
import 'package:great_talk/presentation/component/rounded_button.dart';

void main() {
  group('UpdateButtonWidget', () {
    testWidgets('should display update button with text', (
      WidgetTester tester,
    ) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UpdateButtonWidget(
              onPressed: () {
                wasPressed = true;
              },
            ),
          ),
        ),
      );

      expect(find.text('更新する'), findsOneWidget);
      expect(find.byType(RoundedButton), findsOneWidget);

      await tester.tap(find.byType(RoundedButton));
      await tester.pump();

      expect(wasPressed, true);
    });

    testWidgets('should have correct styling', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(primaryColor: Colors.blue),
          home: Scaffold(body: UpdateButtonWidget(onPressed: () {})),
        ),
      );

      expect(find.text('更新する'), findsOneWidget);
      expect(find.byType(RoundedButton), findsOneWidget);
    });

    testWidgets('should work in different themes', (WidgetTester tester) async {
      final themes = [ThemeData.light(), ThemeData.dark()];

      for (final theme in themes) {
        await tester.pumpWidget(
          MaterialApp(
            theme: theme,
            home: Scaffold(body: UpdateButtonWidget(onPressed: () {})),
          ),
        );

        expect(find.text('更新する'), findsOneWidget);
        expect(find.byType(RoundedButton), findsOneWidget);
      }
    });

    testWidgets('should be tappable', (WidgetTester tester) async {
      int tapCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UpdateButtonWidget(
              onPressed: () {
                tapCount++;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(RoundedButton));
      await tester.pump();

      expect(tapCount, 1);

      await tester.tap(find.byType(RoundedButton));
      await tester.pump();

      expect(tapCount, 2);
    });

    testWidgets('should use RoundedButton internally', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: UpdateButtonWidget(onPressed: () {}))),
      );

      // RoundedButton creates an RoundedButton internally
      expect(find.byType(RoundedButton), findsOneWidget);
      expect(find.text('更新する'), findsOneWidget);
    });

    testWidgets('should maintain consistent appearance', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                UpdateButtonWidget(onPressed: () {}),
                UpdateButtonWidget(onPressed: () {}),
              ],
            ),
          ),
        ),
      );

      expect(find.text('更新する'), findsNWidgets(2));
      expect(find.byType(RoundedButton), findsNWidgets(2));
    });
  });
}
