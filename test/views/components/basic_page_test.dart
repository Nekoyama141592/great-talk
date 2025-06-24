import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/views/components/basic_page.dart';

void main() {
  group('BasicPage', () {
    testWidgets('should render with SafeArea and Scaffold', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: BasicPage(child: Text('Test Content'))),
      );

      expect(find.byType(BasicPage), findsOneWidget);
      expect(find.byType(SafeArea), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('should render with AppBar when appBarText is provided', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: BasicPage(
            appBarText: 'Test Title',
            child: Text('Test Content'),
          ),
        ),
      );

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('should not render AppBar when appBarText is null', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: BasicPage(child: Text('Test Content'))),
      );

      expect(find.byType(AppBar), findsNothing);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('should render with FloatingActionButton when provided', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BasicPage(
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
            child: const Text('Test Content'),
          ),
        ),
      );

      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('should not render FloatingActionButton when not provided', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: BasicPage(child: Text('Test Content'))),
      );

      expect(find.byType(FloatingActionButton), findsNothing);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('should apply correct padding to body', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: BasicPage(child: Text('Test Content'))),
      );

      final paddings = tester.widgetList<Padding>(find.byType(Padding));
      final bodyPadding = paddings.firstWhere(
        (padding) => padding.padding == const EdgeInsets.all(16.0),
      );
      expect(bodyPadding.padding, const EdgeInsets.all(16.0));
    });

    testWidgets('should render child widget correctly', (
      WidgetTester tester,
    ) async {
      const key = Key('test_child');

      await tester.pumpWidget(
        const MaterialApp(
          home: BasicPage(child: Text('Test Content', key: key)),
        ),
      );

      expect(find.byKey(key), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('should work with complex child widgets', (
      WidgetTester tester,
    ) async {
      final complexChild = Column(
        children: [
          const Text('Title'),
          const Divider(),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) => Text('Item $index'),
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: BasicPage(appBarText: 'Complex Page', child: complexChild),
        ),
      );

      expect(find.text('Complex Page'), findsOneWidget);
      expect(find.text('Title'), findsOneWidget);
      expect(find.byType(Divider), findsOneWidget);
      expect(find.text('Item 0'), findsOneWidget);
      expect(find.text('Item 1'), findsOneWidget);
      expect(find.text('Item 2'), findsOneWidget);
    });

    testWidgets('should handle AppBar with different text lengths', (
      WidgetTester tester,
    ) async {
      const longTitle = 'This is a very long title that might overflow';

      await tester.pumpWidget(
        const MaterialApp(
          home: BasicPage(appBarText: longTitle, child: Text('Test Content')),
        ),
      );

      expect(find.text(longTitle), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('should maintain widget structure with all parameters', (
      WidgetTester tester,
    ) async {
      bool fabPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: BasicPage(
            appBarText: 'Full Test',
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                fabPressed = true;
              },
              child: const Icon(Icons.save),
            ),
            child: const Text('Full Content'),
          ),
        ),
      );

      expect(find.byType(BasicPage), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('Full Test'), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.byIcon(Icons.save), findsOneWidget);
      expect(find.text('Full Content'), findsOneWidget);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      expect(fabPressed, true);
    });

    testWidgets('should handle empty child content', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: BasicPage(child: SizedBox.shrink())),
      );

      expect(find.byType(BasicPage), findsOneWidget);
      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('should work with multiple BasicPage instances', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: PageView(
            children: const [
              BasicPage(appBarText: 'Page 1', child: Text('Content 1')),
              BasicPage(appBarText: 'Page 2', child: Text('Content 2')),
            ],
          ),
        ),
      );

      expect(find.text('Page 1'), findsOneWidget);
      expect(find.text('Content 1'), findsOneWidget);
    });

    testWidgets('should have consistent key behavior', (
      WidgetTester tester,
    ) async {
      const key = Key('basic_page_key');

      await tester.pumpWidget(
        const MaterialApp(home: BasicPage(key: key, child: Text('Test'))),
      );

      expect(find.byKey(key), findsOneWidget);
      expect(find.byType(BasicPage), findsOneWidget);
    });

    testWidgets('should be a StatelessWidget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: BasicPage(child: Text('Test'))),
      );

      expect(find.byType(BasicPage), findsOneWidget);
    });

    testWidgets('should handle theme changes properly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const BasicPage(appBarText: 'Theme Test', child: Text('Test')),
        ),
      );

      expect(find.text('Theme Test'), findsOneWidget);

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: const BasicPage(appBarText: 'Theme Test', child: Text('Test')),
        ),
      );

      expect(find.text('Theme Test'), findsOneWidget);
    });
  });
}
