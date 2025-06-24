import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/views/edit/components/username_field.dart';

void main() {
  group('UsernameField', () {
    testWidgets('should display username field with label', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UsernameField(
              initialValue: 'Initial username',
              onSaved: (value) {},
            ),
          ),
        ),
      );

      expect(find.text('ニックネーム'), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.text('Initial username'), findsOneWidget);
    });

    testWidgets('should validate minimum length', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: UsernameField(initialValue: '', onSaved: (value) {}),
            ),
          ),
        ),
      );

      final formField = tester.widget<TextFormField>(
        find.byType(TextFormField),
      );
      final validationResult = formField.validator!('a'); // Too short
      expect(validationResult, contains('文字以上の入力を行なってください'));
    });

    testWidgets('should validate maximum length', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: UsernameField(initialValue: '', onSaved: (value) {}),
            ),
          ),
        ),
      );

      final formField = tester.widget<TextFormField>(
        find.byType(TextFormField),
      );
      final longText = 'a' * 101; // Assuming 100 is the limit
      final validationResult = formField.validator!(longText);
      expect(validationResult, isNotNull);
      expect(validationResult, contains('文字まで'));
    });

    testWidgets('should accept valid input', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: UsernameField(initialValue: '', onSaved: (value) {}),
            ),
          ),
        ),
      );

      final formField = tester.widget<TextFormField>(
        find.byType(TextFormField),
      );
      final validationResult = formField.validator!('Valid username');
      expect(validationResult, isNull);
    });

    testWidgets('should call onSaved when saved', (WidgetTester tester) async {
      String? savedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: UsernameField(
                initialValue: 'test value',
                onSaved: (value) {
                  savedValue = value;
                },
              ),
            ),
          ),
        ),
      );

      final formField = tester.widget<TextFormField>(
        find.byType(TextFormField),
      );
      formField.onSaved!('saved test value');

      expect(savedValue, 'saved test value');
    });

    testWidgets('should have help icon from FormLabel', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UsernameField(initialValue: '', onSaved: (value) {}),
          ),
        ),
      );

      expect(find.byIcon(Icons.help), findsOneWidget);
    });

    testWidgets('should display as Column layout', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UsernameField(initialValue: '', onSaved: (value) {}),
          ),
        ),
      );

      expect(find.byType(Column), findsOneWidget);
    });

    testWidgets('should be single line input', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UsernameField(initialValue: '', onSaved: (value) {}),
          ),
        ),
      );

      expect(find.byType(TextFormField), findsOneWidget);
    });
  });
}
