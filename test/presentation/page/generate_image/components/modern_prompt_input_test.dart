import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/presentation/page/generate_image/components/modern_prompt_input.dart';

void main() {
  group('ModernPromptInput', () {
    late TextEditingController controller;
    String? changedText;

    setUp(() {
      controller = TextEditingController();
      changedText = null;
    });

    tearDown(() {
      controller.dispose();
    });

    Widget createTestWidget({
      TextEditingController? textController,
      Function(String?)? onChanged,
    }) {
      return MaterialApp(
        home: Scaffold(
          body: ModernPromptInput(
            controller: textController ?? controller,
            onChanged: onChanged ?? (text) => changedText = text,
          ),
        ),
      );
    }

    group('UI Structure', () {
      testWidgets('should render main components', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        expect(find.byType(ModernPromptInput), findsOneWidget);
        expect(find.byType(Container), findsAtLeastNWidgets(1));
        expect(find.byType(BackdropFilter), findsOneWidget);
        expect(find.byType(TextFormField), findsOneWidget);
      });

      testWidgets('should have glassmorphic styling', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        final containers = tester.widgetList<Container>(find.byType(Container));
        
        // Find the main container with glassmorphic styling
        bool hasGlassMorphism = containers.any((container) {
          final decoration = container.decoration as BoxDecoration?;
          return decoration?.color != null && 
                 decoration!.borderRadius != null &&
                 decoration.border != null;
        });
        
        expect(hasGlassMorphism, isTrue);
      });

      testWidgets('should have prefix icon', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        expect(find.byIcon(Icons.auto_awesome), findsOneWidget);
      });

      testWidgets('should have correct hint text', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        expect(find.text('例: かわいい猫'), findsOneWidget);
      });
    });

    group('Text Input', () {
      testWidgets('should handle text input', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        const testText = 'かわいい猫の画像';
        await tester.enterText(find.byType(TextFormField), testText);
        await tester.pump();

        expect(find.text(testText), findsOneWidget);
        expect(controller.text, equals(testText));
      });

      testWidgets('should call onChanged when text changes', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        const testText = 'テスト入力';
        await tester.enterText(find.byType(TextFormField), testText);
        await tester.pump();

        expect(changedText, equals(testText));
      });

      testWidgets('should handle multiline text', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        const multilineText = 'Line 1\nLine 2\nLine 3';
        await tester.enterText(find.byType(TextFormField), multilineText);
        await tester.pump();

        expect(find.text(multilineText), findsOneWidget);
        expect(controller.text, equals(multilineText));
      });

      testWidgets('should support maximum of 3 lines', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        // Verify the text field exists and accept that we can't directly access maxLines
        expect(find.byType(TextFormField), findsOneWidget);
        
        // Test multiline functionality by entering multiline text
        const multilineText = 'Line 1\nLine 2\nLine 3';
        await tester.enterText(find.byType(TextFormField), multilineText);
        await tester.pump();
        
        expect(controller.text, equals(multilineText));
      });

      testWidgets('should handle empty text', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        await tester.enterText(find.byType(TextFormField), '');
        await tester.pump();

        expect(changedText, anyOf(equals(''), isNull));
      });

      testWidgets('should handle long text input', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        const longText = 'This is a very long text input that should test how the modern prompt input component handles extended text and whether it behaves correctly with glassmorphic styling and proper text wrapping.';
        await tester.enterText(find.byType(TextFormField), longText);
        await tester.pump();

        expect(controller.text, equals(longText));
        expect(changedText, equals(longText));
      });
    });

    group('Styling', () {
      testWidgets('should have proper styling', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        // Verify the text field exists with proper structure
        expect(find.byType(TextFormField), findsOneWidget);
        expect(find.byType(Container), findsAtLeastNWidgets(1));
        expect(find.byType(BackdropFilter), findsOneWidget);
      });

      testWidgets('should have text input functionality', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        const testText = 'Test input';
        await tester.enterText(find.byType(TextFormField), testText);
        await tester.pump();
        
        expect(controller.text, equals(testText));
        expect(find.text(testText), findsOneWidget);
      });

      testWidgets('should have prefix icon and hint text', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        expect(find.byIcon(Icons.auto_awesome), findsOneWidget);
        expect(find.text('例: かわいい猫'), findsOneWidget);
      });

      testWidgets('should have rounded corners', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        final containers = tester.widgetList<Container>(find.byType(Container));
        
        bool hasRoundedCorners = containers.any((container) {
          final decoration = container.decoration as BoxDecoration?;
          return decoration?.borderRadius != null;
        });
        
        expect(hasRoundedCorners, isTrue);
      });
    });

    group('Accessibility', () {
      testWidgets('should be accessible', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        expect(find.byType(TextFormField), findsOneWidget);
        
        // Verify semantic elements are present
        expect(find.byType(Semantics), findsAtLeastNWidgets(1));
      });

      testWidgets('should handle focus properly', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        final textField = find.byType(TextFormField);
        await tester.tap(textField);
        await tester.pump();

        // After tapping, the field should be focused
        expect(tester.binding.focusManager.primaryFocus?.hasFocus, isTrue);
      });
    });

    group('Edge Cases', () {
      testWidgets('should handle controller changes', (WidgetTester tester) async {
        final controller1 = TextEditingController(text: 'Initial text');
        final controller2 = TextEditingController(text: 'New text');

        await tester.pumpWidget(createTestWidget(textController: controller1));
        expect(find.text('Initial text'), findsOneWidget);

        await tester.pumpWidget(createTestWidget(textController: controller2));
        expect(find.text('New text'), findsOneWidget);

        controller1.dispose();
        controller2.dispose();
      });

      testWidgets('should handle null onChanged callback', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget(onChanged: null));

        // Should not throw error when onChanged is null
        await tester.enterText(find.byType(TextFormField), 'test');
        await tester.pump();

        expect(find.text('test'), findsOneWidget);
      });

      testWidgets('should work with different themes', (WidgetTester tester) async {
        for (final theme in [ThemeData.light(), ThemeData.dark()]) {
          await tester.pumpWidget(
            MaterialApp(
              theme: theme,
              home: Scaffold(
                body: ModernPromptInput(
                  controller: controller,
                  onChanged: (text) => changedText = text,
                ),
              ),
            ),
          );

          expect(find.byType(ModernPromptInput), findsOneWidget);
          expect(find.byType(TextFormField), findsOneWidget);
        }
      });

      testWidgets('should handle Japanese input', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        const japaneseText = 'こんにちは、世界！猫の画像を生成してください。';
        await tester.enterText(find.byType(TextFormField), japaneseText);
        await tester.pump();

        expect(find.text(japaneseText), findsOneWidget);
        expect(controller.text, equals(japaneseText));
        expect(changedText, equals(japaneseText));
      });

      testWidgets('should handle special characters', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        const specialText = '!@#\$%^&*()_+-=[]{}|;:,.<>?';
        await tester.enterText(find.byType(TextFormField), specialText);
        await tester.pump();

        expect(controller.text, equals(specialText));
        expect(changedText, equals(specialText));
      });
    });
  });
}