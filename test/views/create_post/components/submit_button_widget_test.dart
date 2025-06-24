import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/views/create_post/components/submit_button_widget.dart';

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
      expect(find.byType(ElevatedButton), findsOneWidget);

      await tester.tap(find.byType(ElevatedButton));
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

      await tester.tap(find.byType(ElevatedButton));
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
      expect(find.byType(ElevatedButton), findsOneWidget);

      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.onPressed, isNull);
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
      expect(find.byType(ElevatedButton), findsOneWidget);
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
        expect(find.byType(ElevatedButton), findsOneWidget);
      }
    });
  });
}
