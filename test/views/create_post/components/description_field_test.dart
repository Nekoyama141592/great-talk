import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/views/create_post/components/description_field.dart';

void main() {
  group('DescriptionField', () {
    testWidgets('should display description field with label', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DescriptionField(
              initialValue: 'Initial description',
              onSaved: (value) {},
            ),
          ),
        ),
      );

      expect(find.text('説明/使い方(AIの一言目)'), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.text('Initial description'), findsOneWidget);
    });

    testWidgets('should validate empty input', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: DescriptionField(initialValue: '', onSaved: (value) {}),
            ),
          ),
        ),
      );

      final formField = tester.widget<TextFormField>(
        find.byType(TextFormField),
      );
      final validationResult = formField.validator!('');
      expect(validationResult, '入力をしてください');
    });

    testWidgets('should accept valid input', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: DescriptionField(initialValue: '', onSaved: (value) {}),
            ),
          ),
        ),
      );

      final formField = tester.widget<TextFormField>(
        find.byType(TextFormField),
      );
      final validationResult = formField.validator!('Valid description');
      expect(validationResult, isNull);
    });

    testWidgets('should call onSaved when saved', (WidgetTester tester) async {
      String? savedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: DescriptionField(
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
            body: DescriptionField(initialValue: '', onSaved: (value) {}),
          ),
        ),
      );

      expect(find.byIcon(Icons.help), findsOneWidget);
    });

    testWidgets('should display as Column layout', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DescriptionField(initialValue: '', onSaved: (value) {}),
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
            body: DescriptionField(initialValue: '', onSaved: (value) {}),
          ),
        ),
      );

      expect(find.byType(TextFormField), findsOneWidget);
    });
  });
}
