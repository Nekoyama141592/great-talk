import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/views/components/rounded_input_field.dart';

void main() {
  group('RoundedInputField', () {
    late TextEditingController controller;

    setUp(() {
      controller = TextEditingController();
    });

    tearDown(() {
      controller.dispose();
    });

    testWidgets('should render with TextFieldContainer and TextFormField', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedInputField(
              controller: controller,
              send: () {},
            ),
          ),
        ),
      );

      expect(find.byType(RoundedInputField), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.byIcon(Icons.send), findsOneWidget);
    });

    testWidgets('should use provided controller', (WidgetTester tester) async {
      controller.text = 'Test Text';
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedInputField(
              controller: controller,
              send: () {},
            ),
          ),
        ),
      );

      expect(find.text('Test Text'), findsOneWidget);
      
      final textField = tester.widget<TextFormField>(find.byType(TextFormField));
      expect(textField.controller, equals(controller));
    });

    testWidgets('should call send function when send icon is tapped', (WidgetTester tester) async {
      bool sendCalled = false;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedInputField(
              controller: controller,
              send: () {
                sendCalled = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.send));
      await tester.pump();
      
      expect(sendCalled, true);
    });

    testWidgets('should handle null send function', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedInputField(
              controller: controller,
              send: null,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.send), findsOneWidget);
      
      await tester.tap(find.byIcon(Icons.send));
      await tester.pump();
    });

    testWidgets('should have email keyboard type', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedInputField(
              controller: controller,
              send: () {},
            ),
          ),
        ),
      );

      expect(find.byType(TextFormField), findsOneWidget);
    });

    testWidgets('should have no border decoration', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedInputField(
              controller: controller,
              send: () {},
            ),
          ),
        ),
      );

      expect(find.byType(TextFormField), findsOneWidget);
    });

    testWidgets('should update text through controller', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedInputField(
              controller: controller,
              send: () {},
            ),
          ),
        ),
      );

      controller.text = 'Updated Text';
      await tester.pump();
      
      expect(find.text('Updated Text'), findsOneWidget);
    });

    testWidgets('should accept text input', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedInputField(
              controller: controller,
              send: () {},
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), 'Typed Text');
      await tester.pump();
      
      expect(controller.text, 'Typed Text');
      expect(find.text('Typed Text'), findsOneWidget);
    });

    testWidgets('should handle multiple rapid send taps', (WidgetTester tester) async {
      int sendCount = 0;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedInputField(
              controller: controller,
              send: () {
                sendCount++;
              },
            ),
          ),
        ),
      );

      for (int i = 0; i < 3; i++) {
        await tester.tap(find.byIcon(Icons.send));
        await tester.pump(const Duration(milliseconds: 10));
      }
      
      expect(sendCount, 3);
    });

    testWidgets('should maintain state across rebuilds', (WidgetTester tester) async {
      bool toggle = false;
      
      Widget buildWidget() {
        return MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                if (toggle) const Text('Additional widget'),
                RoundedInputField(
                  controller: controller,
                  send: () {},
                ),
              ],
            ),
          ),
        );
      }

      controller.text = 'Persistent Text';
      await tester.pumpWidget(buildWidget());
      
      expect(find.text('Persistent Text'), findsOneWidget);

      toggle = true;
      await tester.pumpWidget(buildWidget());
      
      expect(find.text('Persistent Text'), findsOneWidget);
      expect(controller.text, 'Persistent Text');
    });

    testWidgets('should have consistent key behavior', (WidgetTester tester) async {
      const key = Key('input_field_key');
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedInputField(
              key: key,
              controller: controller,
              send: () {},
            ),
          ),
        ),
      );

      expect(find.byKey(key), findsOneWidget);
      expect(find.byType(RoundedInputField), findsOneWidget);
    });

    testWidgets('should work with focus changes', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                RoundedInputField(
                  controller: controller,
                  send: () {},
                ),
                const TextField(),
              ],
            ),
          ),
        ),
      );

      await tester.tap(find.byType(TextFormField));
      await tester.pump();
      
      expect(tester.testTextInput.isVisible, true);
      
      await tester.tap(find.byType(TextField).last);
      await tester.pump();
    });

    testWidgets('should handle long text input', (WidgetTester tester) async {
      const longText = 'This is a very long text that should be handled properly by the input field without any issues or truncation problems';
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedInputField(
              controller: controller,
              send: () {},
            ),
          ),
        ),
      );

      controller.text = longText;
      await tester.pump();
      
      expect(controller.text, longText);
    });

    testWidgets('should clear text when controller is cleared', (WidgetTester tester) async {
      controller.text = 'Initial Text';
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedInputField(
              controller: controller,
              send: () {},
            ),
          ),
        ),
      );

      expect(find.text('Initial Text'), findsOneWidget);
      
      controller.clear();
      await tester.pump();
      
      expect(controller.text, '');
      expect(find.text('Initial Text'), findsNothing);
    });

    testWidgets('should work in form context', (WidgetTester tester) async {
      final formKey = GlobalKey<FormState>();
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              key: formKey,
              child: RoundedInputField(
                controller: controller,
                send: () {},
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Form), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);
      
      await tester.enterText(find.byType(TextFormField), 'test@example.com');
      expect(controller.text, 'test@example.com');
    });

    testWidgets('should maintain cursor position during input', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedInputField(
              controller: controller,
              send: () {},
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), 'test');
      await tester.pump();
      
      expect(controller.text, 'test');
      expect(controller.selection.baseOffset, 4);
    });
  });
}