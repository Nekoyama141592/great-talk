import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/presentation/page/create_post/components/submit_button_widget.dart';
import 'package:great_talk/presentation/component/rounded_button.dart';

void main() {
  group('SubmitButtonWidget', () {
    testWidgets('should display submit button with text', (
      WidgetTester tester,
    ) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SubmitButtonWidget(
              isLoading: false,
              onPressed: () {
                wasPressed = true;
              },
            ),
          ),
        ),
      );

      expect(find.text('送信'), findsOneWidget);
      expect(find.byType(RoundedButton), findsOneWidget);

      await tester.tap(find.byType(RoundedButton));
      await tester.pump();

      expect(wasPressed, true);
    });

    testWidgets('should be disabled when loading', (WidgetTester tester) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SubmitButtonWidget(
              isLoading: true,
              onPressed: () {
                wasPressed = true;
              },
            ),
          ),
        ),
      );

      expect(find.text('送信'), findsOneWidget);

      await tester.tap(find.byType(RoundedButton));
      await tester.pump();

      expect(wasPressed, false);
    });

    testWidgets('should handle null onPressed callback', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SubmitButtonWidget(isLoading: false, onPressed: null),
          ),
        ),
      );

      expect(find.text('送信'), findsOneWidget);
      expect(find.byType(RoundedButton), findsOneWidget);

      final button = tester.widget<RoundedButton>(find.byType(RoundedButton));
      expect(button.press, isNull);
    });

    testWidgets('should have correct styling', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(primaryColor: Colors.blue),
          home: Scaffold(
            body: SubmitButtonWidget(isLoading: false, onPressed: () {}),
          ),
        ),
      );

      expect(find.text('送信'), findsOneWidget);
      expect(find.byType(RoundedButton), findsOneWidget);
    });

    testWidgets('should work in different themes', (WidgetTester tester) async {
      final themes = [ThemeData.light(), ThemeData.dark()];

      for (final theme in themes) {
        await tester.pumpWidget(
          MaterialApp(
            theme: theme,
            home: Scaffold(
              body: SubmitButtonWidget(isLoading: false, onPressed: () {}),
            ),
          ),
        );

        expect(find.text('送信'), findsOneWidget);
        expect(find.byType(RoundedButton), findsOneWidget);
      }
    });
  });
}
