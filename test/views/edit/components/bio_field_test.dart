import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/views/edit/components/bio_field.dart';

void main() {
  group('BioField', () {
    testWidgets('should display bio field with label', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BioField(
              initialValue: 'Initial bio',
              onSaved: (value) {},
            ),
          ),
        ),
      );

      expect(find.text('紹介文'), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.text('Initial bio'), findsOneWidget);
    });

    testWidgets('should validate empty input', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: BioField(
                initialValue: '',
                onSaved: (value) {},
              ),
            ),
          ),
        ),
      );

      final formField = tester.widget<TextFormField>(find.byType(TextFormField));
      final validationResult = formField.validator!('');
      expect(validationResult, '入力を行なってください');
    });

    testWidgets('should validate text length limit', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: BioField(
                initialValue: '',
                onSaved: (value) {},
              ),
            ),
          ),
        ),
      );

      final formField = tester.widget<TextFormField>(find.byType(TextFormField));
      final longText = 'a' * 1001; // Assuming 1000 is the limit
      final validationResult = formField.validator!(longText);
      expect(validationResult, isNotNull);
      expect(validationResult, contains('文字まで'));
    });

    testWidgets('should accept valid input', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: BioField(
                initialValue: '',
                onSaved: (value) {},
              ),
            ),
          ),
        ),
      );

      final formField = tester.widget<TextFormField>(find.byType(TextFormField));
      final validationResult = formField.validator!('Valid bio text');
      expect(validationResult, isNull);
    });

    testWidgets('should call onSaved when saved', (WidgetTester tester) async {
      String? savedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: BioField(
                initialValue: 'test value',
                onSaved: (value) {
                  savedValue = value;
                },
              ),
            ),
          ),
        ),
      );

      final formField = tester.widget<TextFormField>(find.byType(TextFormField));
      formField.onSaved!('saved test value');
      
      expect(savedValue, 'saved test value');
    });

    testWidgets('should have help icon from FormLabel', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BioField(
              initialValue: '',
              onSaved: (value) {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.help), findsOneWidget);
    });

    testWidgets('should display as Column layout', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BioField(
              initialValue: '',
              onSaved: (value) {},
            ),
          ),
        ),
      );

      expect(find.byType(Column), findsOneWidget);
    });

    testWidgets('should handle empty initial value', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BioField(
              initialValue: '',
              onSaved: (value) {},
            ),
          ),
        ),
      );

      expect(find.byType(TextFormField), findsOneWidget);
    });
  });
}