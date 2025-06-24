import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/views/create_post/components/system_prompt_field.dart';

void main() {
  group('SystemPromptField', () {
    testWidgets('should display system prompt field with label', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SystemPromptField(
              initialValue: 'Initial system prompt',
              onSaved: (value) {},
            ),
          ),
        ),
      );

      expect(find.text('システムプロンプト'), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.text('Initial system prompt'), findsOneWidget);
    });

    testWidgets('should validate empty input', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: SystemPromptField(
                initialValue: '',
                onSaved: (value) {},
              ),
            ),
          ),
        ),
      );

      final formField = tester.widget<TextFormField>(find.byType(TextFormField));
      final validationResult = formField.validator!('');
      expect(validationResult, '入力をしてください');
    });

    testWidgets('should accept valid input', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: SystemPromptField(
                initialValue: '',
                onSaved: (value) {},
              ),
            ),
          ),
        ),
      );

      final formField = tester.widget<TextFormField>(find.byType(TextFormField));
      final validationResult = formField.validator!('Valid system prompt');
      expect(validationResult, isNull);
    });

    testWidgets('should call onSaved when saved', (WidgetTester tester) async {
      String? savedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              child: SystemPromptField(
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
            body: SystemPromptField(
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
            body: SystemPromptField(
              initialValue: '',
              onSaved: (value) {},
            ),
          ),
        ),
      );

      expect(find.byType(Column), findsOneWidget);
    });
  });
}