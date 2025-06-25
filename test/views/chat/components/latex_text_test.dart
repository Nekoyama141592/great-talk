import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:great_talk/presentation/page/chat/components/latex_text.dart';

void main() {
  group('LatexText', () {
    testWidgets('should display GptMarkdown with white text style', (
      WidgetTester tester,
    ) async {
      const testData = 'Test markdown content';

      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: LatexText(data: testData))),
      );

      expect(find.byType(LatexText), findsOneWidget);
      expect(find.byType(GptMarkdown), findsOneWidget);

      final gptMarkdown = tester.widget<GptMarkdown>(find.byType(GptMarkdown));
      expect(gptMarkdown.data, testData);
      expect(gptMarkdown.style?.color, Colors.white);
    });

    testWidgets('should handle different markdown content', (
      WidgetTester tester,
    ) async {
      final testCases = [
        'Simple text',
        '# Heading',
        '**Bold text**',
        '_Italic text_',
        '`Code block`',
        '- List item',
        'Text with numbers: 123',
        'Text with symbols: !@#\$%',
        'Japanese text: こんにちは',
        'Mixed content: # Title\n\n**Bold** and _italic_ text.',
      ];

      for (final data in testCases) {
        await tester.pumpWidget(
          MaterialApp(home: Scaffold(body: LatexText(data: data))),
        );

        expect(find.byType(GptMarkdown), findsOneWidget);

        final gptMarkdown = tester.widget<GptMarkdown>(
          find.byType(GptMarkdown),
        );
        expect(gptMarkdown.data, data);
        expect(gptMarkdown.style?.color, Colors.white);
      }
    });

    testWidgets('should handle empty string', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: LatexText(data: ''))),
      );

      expect(find.byType(GptMarkdown), findsOneWidget);

      final gptMarkdown = tester.widget<GptMarkdown>(find.byType(GptMarkdown));
      expect(gptMarkdown.data, '');
      expect(gptMarkdown.style?.color, Colors.white);
    });

    testWidgets('should be a StatelessWidget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: LatexText(data: 'Test'))),
      );

      expect(find.byType(LatexText), findsOneWidget);
    });

    testWidgets('should work with different themes', (
      WidgetTester tester,
    ) async {
      const testData = 'Theme test content';

      Widget buildWithTheme(ThemeData theme) {
        return MaterialApp(
          theme: theme,
          home: Scaffold(body: LatexText(data: testData)),
        );
      }

      // Test with light theme
      await tester.pumpWidget(buildWithTheme(ThemeData.light()));
      final lightGptMarkdown = tester.widget<GptMarkdown>(
        find.byType(GptMarkdown),
      );
      expect(lightGptMarkdown.style?.color, Colors.white);

      // Test with dark theme
      await tester.pumpWidget(buildWithTheme(ThemeData.dark()));
      final darkGptMarkdown = tester.widget<GptMarkdown>(
        find.byType(GptMarkdown),
      );
      expect(darkGptMarkdown.style?.color, Colors.white);
    });

    testWidgets('should handle multi-line content', (
      WidgetTester tester,
    ) async {
      const multiLineData = '''
# Title
This is a paragraph with multiple lines.

## Subtitle
- List item 1
- List item 2

**Bold text** and _italic text_.
''';

      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: LatexText(data: multiLineData))),
      );

      expect(find.byType(GptMarkdown), findsOneWidget);

      final gptMarkdown = tester.widget<GptMarkdown>(find.byType(GptMarkdown));
      expect(gptMarkdown.data, multiLineData);
      expect(gptMarkdown.style?.color, Colors.white);
    });

    testWidgets('should work in different layout contexts', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: const [
                Text('Header'),
                LatexText(data: 'First content'),
                SizedBox(height: 10),
                LatexText(data: 'Second content'),
                Text('Footer'),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(LatexText), findsNWidgets(2));
      expect(find.byType(GptMarkdown), findsNWidgets(2));

      final gptMarkdowns = tester.widgetList<GptMarkdown>(
        find.byType(GptMarkdown),
      );
      expect(gptMarkdowns.elementAt(0).data, 'First content');
      expect(gptMarkdowns.elementAt(1).data, 'Second content');
    });

    testWidgets('should handle special characters and LaTeX', (
      WidgetTester tester,
    ) async {
      const latexData = r'''
Math formula: $E = mc^2$

Inline math: $\alpha + \beta = \gamma$

Block math:
$$\int_{-\infty}^{\infty} e^{-x^2} dx = \sqrt{\pi}$$

Special characters: &lt; &gt; &amp;
''';

      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: LatexText(data: latexData))),
      );

      expect(find.byType(GptMarkdown), findsOneWidget);

      final gptMarkdown = tester.widget<GptMarkdown>(find.byType(GptMarkdown));
      expect(gptMarkdown.data, latexData);
      expect(gptMarkdown.style?.color, Colors.white);
    });

    testWidgets('should have proper key behavior', (WidgetTester tester) async {
      const key = Key('latex_text_key');

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: LatexText(key: key, data: 'Keyed content')),
        ),
      );

      expect(find.byKey(key), findsOneWidget);
      expect(find.byType(LatexText), findsOneWidget);
    });

    testWidgets('should maintain consistent behavior across rebuilds', (
      WidgetTester tester,
    ) async {
      String data = 'Initial content';
      bool toggle = false;

      Widget buildWidget() {
        return MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                if (toggle) const Text('Toggle State'),
                LatexText(data: data),
              ],
            ),
          ),
        );
      }

      await tester.pumpWidget(buildWidget());
      final initialGptMarkdown = tester.widget<GptMarkdown>(
        find.byType(GptMarkdown),
      );
      expect(initialGptMarkdown.data, 'Initial content');

      // Change data and rebuild
      data = 'Updated content';
      toggle = true;
      await tester.pumpWidget(buildWidget());

      expect(find.text('Toggle State'), findsOneWidget);
      final updatedGptMarkdown = tester.widget<GptMarkdown>(
        find.byType(GptMarkdown),
      );
      expect(updatedGptMarkdown.data, 'Updated content');
      expect(updatedGptMarkdown.style?.color, Colors.white);
    });

    testWidgets('should work within scrollable widgets', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ListView(
              children: const [
                Text('Header'),
                LatexText(data: 'Scrollable content 1'),
                LatexText(data: 'Scrollable content 2'),
                Text('Footer'),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(LatexText), findsNWidgets(2));
      expect(find.byType(GptMarkdown), findsNWidgets(2));
    });
  });
}
