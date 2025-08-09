import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/presentation/page/create_post/components/form_label.dart';

void main() {
  group('FormLabel', () {
    testWidgets('should display title and help icon', (
      WidgetTester tester,
    ) async {
      const title = 'Test Label';
      const helpMessage = 'This is a help message';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: FormLabel(title: title, helpMsg: helpMessage)),
        ),
      );

      expect(find.text(title), findsOneWidget);
      expect(find.byIcon(Icons.help), findsOneWidget);
    });

    testWidgets('should have correct layout structure', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FormLabel(title: 'Test Title', helpMsg: 'Help message'),
          ),
        ),
      );

      expect(find.byType(Align), findsOneWidget);
      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(InkWell), findsOneWidget);

      final align = tester.widget<Align>(find.byType(Align));
      expect(align.alignment, Alignment.centerLeft);
    });

    testWidgets('should be tappable', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FormLabel(title: 'Test Title', helpMsg: 'Help message'),
          ),
        ),
      );

      expect(find.byType(InkWell), findsOneWidget);

      // Verify that the InkWell has an onTap callback
      final inkWell = tester.widget<InkWell>(find.byType(InkWell));
      expect(inkWell.onTap, isNotNull);
    });

    testWidgets('should display different titles correctly', (
      WidgetTester tester,
    ) async {
      final titles = [
        'フォーム名',
        'タイトル',
        'Label Name',
        'Form Field',
        '🏷️ Emoji Label',
      ];

      for (final title in titles) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FormLabel(title: title, helpMsg: 'Help for $title'),
            ),
          ),
        );

        expect(find.text(title), findsOneWidget);
        expect(find.byIcon(Icons.help), findsOneWidget);
      }
    });

    testWidgets('should handle different help messages', (
      WidgetTester tester,
    ) async {
      final helpMessages = [
        'Short help',
        'このフィールドは必須です。適切な値を入力してください。',
        'A very detailed help message that explains exactly what this form field is for and how to fill it out correctly.',
        '',
      ];

      for (final helpMsg in helpMessages) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FormLabel(title: 'Test Title', helpMsg: helpMsg),
            ),
          ),
        );

        expect(find.text('Test Title'), findsOneWidget);
        expect(find.byIcon(Icons.help), findsOneWidget);
      }
    });

    testWidgets('should handle empty strings gracefully', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: FormLabel(title: '', helpMsg: '')),
        ),
      );

      expect(find.text(''), findsOneWidget); // Empty title
      expect(find.byIcon(Icons.help), findsOneWidget);
    });

    testWidgets('should work with different screen sizes', (
      WidgetTester tester,
    ) async {
      const title = 'Responsive Test';
      const helpMessage = 'Test help message';

      final screenSizes = [
        const Size(400, 800), // Mobile
        const Size(768, 1024), // Tablet
        const Size(1200, 800), // Desktop
      ];

      for (final size in screenSizes) {
        await tester.binding.setSurfaceSize(size);

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(body: FormLabel(title: title, helpMsg: helpMessage)),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.text(title), findsOneWidget);
        expect(find.byIcon(Icons.help), findsOneWidget);
        expect(find.byType(Align), findsOneWidget);
      }

      // Reset to default size
      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('should work within different parent layouts', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                Text('Form Header'),
                FormLabel(
                  title: 'First Field',
                  helpMsg: 'Help for first field',
                ),
                SizedBox(height: 10),
                FormLabel(
                  title: 'Second Field',
                  helpMsg: 'Help for second field',
                ),
                Text('Form Footer'),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Form Header'), findsOneWidget);
      expect(find.text('First Field'), findsOneWidget);
      expect(find.text('Second Field'), findsOneWidget);
      expect(find.text('Form Footer'), findsOneWidget);
      expect(find.byType(FormLabel), findsNWidgets(2));
      expect(find.byIcon(Icons.help), findsNWidgets(2));
    });

    testWidgets('should handle theme changes', (WidgetTester tester) async {
      const title = 'Theme Test';
      const helpMessage = 'Help message';

      // Test with light theme
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: FormLabel(title: title, helpMsg: helpMessage),
          ),
        ),
      );

      expect(find.text(title), findsOneWidget);
      expect(find.byIcon(Icons.help), findsOneWidget);

      // Test with dark theme
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: const Scaffold(
            body: FormLabel(title: title, helpMsg: helpMessage),
          ),
        ),
      );

      expect(find.text(title), findsOneWidget);
      expect(find.byIcon(Icons.help), findsOneWidget);
    });

    testWidgets('should maintain layout consistency across different content', (
      WidgetTester tester,
    ) async {
      final testCases = [
        {'title': 'Short', 'help': 'Short'},
        {
          'title': 'Very Long Title That Might Wrap',
          'help': 'Very long help message',
        },
        {'title': '日本語タイトル', 'help': '日本語ヘルプメッセージ'},
        {'title': '🎯 Target Field', 'help': '📋 Help with emojis'},
      ];

      for (final testCase in testCases) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: FormLabel(
                title: testCase['title']!,
                helpMsg: testCase['help']!,
              ),
            ),
          ),
        );

        // Verify consistent structure
        expect(find.byType(Align), findsOneWidget);
        expect(find.byType(Row), findsOneWidget);
        expect(find.byIcon(Icons.help), findsOneWidget);
        expect(find.text(testCase['title']!), findsOneWidget);

        final align = tester.widget<Align>(find.byType(Align));
        expect(align.alignment, Alignment.centerLeft);
      }
    });

    testWidgets('should have correct icon placement', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FormLabel(title: 'Test Title', helpMsg: 'Test help'),
          ),
        ),
      );

      final row = tester.widget<Row>(find.byType(Row));
      expect(row.children.length, 3); // title, height box, inkwell with icon

      // The third child should be the InkWell with help icon
      final inkWell = row.children[2] as InkWell;
      final icon = inkWell.child as Icon;
      expect(icon.icon, Icons.help);
    });

    testWidgets('should handle accessibility', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FormLabel(
              title: 'Accessible Label',
              helpMsg: 'Accessible help message',
            ),
          ),
        ),
      );

      // Verify the content is accessible
      expect(find.text('Accessible Label'), findsOneWidget);
      expect(find.byIcon(Icons.help), findsOneWidget);

      // Verify tappable area for help
      final inkWellFinder = find.byType(InkWell);
      expect(inkWellFinder, findsOneWidget);

      // Verify help icon is within the tappable area
      final helpIconFinder = find.descendant(
        of: inkWellFinder,
        matching: find.byIcon(Icons.help),
      );
      expect(helpIconFinder, findsOneWidget);
    });

    group('Edge cases', () {
      testWidgets('should handle long title text', (WidgetTester tester) async {
        const longTitle = 'Long Title Text';
        const helpMessage = 'Help for long title';

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: SizedBox(
                width: 300,
                child: FormLabel(title: longTitle, helpMsg: helpMessage),
              ),
            ),
          ),
        );

        expect(find.text(longTitle), findsOneWidget);
        expect(find.byIcon(Icons.help), findsOneWidget);
      });

      testWidgets('should handle special characters', (
        WidgetTester tester,
      ) async {
        const specialTitle = 'Title @#\$%';
        const specialHelp = 'Help @#\$%';

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: FormLabel(title: specialTitle, helpMsg: specialHelp),
            ),
          ),
        );

        expect(find.text(specialTitle), findsOneWidget);
        expect(find.byIcon(Icons.help), findsOneWidget);
      });

      testWidgets('should maintain state across rebuilds', (
        WidgetTester tester,
      ) async {
        String title = 'Initial Title';
        String helpMsg = 'Initial Help';

        Widget buildFormLabel() {
          return MaterialApp(
            home: Scaffold(body: FormLabel(title: title, helpMsg: helpMsg)),
          );
        }

        await tester.pumpWidget(buildFormLabel());
        expect(find.text('Initial Title'), findsOneWidget);

        // Change content and rebuild
        title = 'Updated Title';
        helpMsg = 'Updated Help';
        await tester.pumpWidget(buildFormLabel());
        expect(find.text('Updated Title'), findsOneWidget);
        expect(find.text('Initial Title'), findsNothing);

        // Verify structure remains consistent
        expect(find.byType(Align), findsOneWidget);
        expect(find.byType(Row), findsOneWidget);
        expect(find.byIcon(Icons.help), findsOneWidget);
      });
    });
  });
}
