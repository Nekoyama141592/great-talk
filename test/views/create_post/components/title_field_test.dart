import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/views/create_post/components/title_field.dart';

void main() {
  group('TitleField', () {
    testWidgets('should display title field with label', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TitleField(
              initialValue: 'Initial title',
              onSaved: (value) {},
            ),
          ),
        ),
      );

      expect(find.text('タイトル'), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.text('Initial title'), findsOneWidget);
    });

    testWidgets('should validate minimum length', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: TitleField(initialValue: '', onSaved: (value) {}),
            ),
          ),
        ),
      );

      final formField = tester.widget<TextFormField>(
        find.byType(TextFormField),
      );
      final validationResult = formField.validator!('a'); // Too short
      expect(validationResult, contains('文字以上の入力をしてください'));
    });

    testWidgets('should accept valid input', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: TitleField(initialValue: '', onSaved: (value) {}),
            ),
          ),
        ),
      );

      final formField = tester.widget<TextFormField>(
        find.byType(TextFormField),
      );
      final validationResult = formField.validator!('Valid title');
      expect(validationResult, isNull);
    });

    testWidgets('should call onSaved when saved', (WidgetTester tester) async {
      String? savedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: TitleField(
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
            body: TitleField(initialValue: '', onSaved: (value) {}),
          ),
        ),
      );

      expect(find.byIcon(Icons.help), findsOneWidget);
    });

    testWidgets('should display as Column layout', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TitleField(initialValue: '', onSaved: (value) {}),
          ),
        ),
      );

      expect(find.byType(Column), findsOneWidget);
    });

    testWidgets('should handle empty initial value', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TitleField(initialValue: '', onSaved: (value) {}),
          ),
        ),
      );

      expect(find.byType(TextFormField), findsOneWidget);
    });
  });
}
