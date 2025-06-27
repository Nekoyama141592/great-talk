import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/presentation/component/mosaic_card/mosaic_card.dart';
import 'package:great_talk/presentation/constant/colors.dart';

void main() {
  group('MosaicCard', () {
    testWidgets('should display child widget correctly', (
      WidgetTester tester,
    ) async {
      const testChild = Text('Test Content');

      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: MosaicCard(child: testChild))),
      );

      expect(find.text('Test Content'), findsOneWidget);
      expect(find.byWidget(testChild), findsOneWidget);
    });

    testWidgets('should have correct container styling', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: MosaicCard(child: Text('Test'))),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;

      // Test background color
      expect(decoration.color, Colors.black);

      // Test border radius
      expect(decoration.borderRadius, BorderRadius.circular(10.0));

      // Test box shadow
      expect(decoration.boxShadow, isNotNull);
      expect(decoration.boxShadow!.length, 1);

      final shadow = decoration.boxShadow!.first;
      expect(shadow.color, Colors.grey.withAlpha(alpha50));
      expect(shadow.spreadRadius, 3);
      expect(shadow.blurRadius, 7);
      expect(shadow.offset, const Offset(0, 3));
    });

    testWidgets('should handle different child widgets', (
      WidgetTester tester,
    ) async {
      final childWidgets = [
        const Text('Text Widget'),
        const Icon(Icons.star),
        Container(width: 50, height: 50, color: Colors.red),
        const SizedBox(width: 100, height: 100),
      ];

      for (final child in childWidgets) {
        await tester.pumpWidget(
          MaterialApp(home: Scaffold(body: MosaicCard(child: child))),
        );

        expect(find.byWidget(child), findsOneWidget);
        expect(find.byType(MosaicCard), findsOneWidget);
      }
    });

    testWidgets('should handle complex child layouts', (
      WidgetTester tester,
    ) async {
      const complexChild = Column(
        children: [
          Text('Title'),
          Row(children: [Icon(Icons.star), Text('Rating')]),
          SizedBox(height: 20),
          Text('Description'),
        ],
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: MosaicCard(child: complexChild)),
        ),
      );

      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Rating'), findsOneWidget);
      expect(find.text('Description'), findsOneWidget);
      expect(find.byIcon(Icons.star), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('should maintain styling with empty child', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: MosaicCard(child: SizedBox.shrink())),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;

      expect(decoration.color, Colors.black);
      expect(decoration.borderRadius, BorderRadius.circular(10.0));
      expect(decoration.boxShadow, isNotNull);
    });

    testWidgets('should handle different screen sizes', (
      WidgetTester tester,
    ) async {
      const child = Text('Responsive Test');

      // Test with different screen sizes
      final screenSizes = [
        const Size(400, 800), // Mobile
        const Size(768, 1024), // Tablet
        const Size(1200, 800), // Desktop
      ];

      for (final size in screenSizes) {
        await tester.binding.setSurfaceSize(size);

        await tester.pumpWidget(
          const MaterialApp(home: Scaffold(body: MosaicCard(child: child))),
        );

        await tester.pumpAndSettle();

        expect(find.byType(MosaicCard), findsOneWidget);
        expect(find.text('Responsive Test'), findsOneWidget);

        // Verify styling is maintained
        final container = tester.widget<Container>(find.byType(Container));
        final decoration = container.decoration as BoxDecoration;
        expect(decoration.color, Colors.black);
      }

      // Reset to default size
      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('should work within different parent layouts', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                const Text('Header'),
                Expanded(
                  child: ListView(
                    children: const [
                      MosaicCard(child: Text('Item 1')),
                      SizedBox(height: 10),
                      MosaicCard(child: Text('Item 2')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Header'), findsOneWidget);
      expect(find.text('Item 1'), findsOneWidget);
      expect(find.text('Item 2'), findsOneWidget);
      expect(find.byType(MosaicCard), findsNWidgets(2));
    });

    testWidgets('should maintain accessibility', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: MosaicCard(child: Text('Accessible Content'))),
        ),
      );

      // Verify the content is accessible
      final textFinder = find.text('Accessible Content');
      expect(textFinder, findsOneWidget);

      // Verify tappable area if needed (container should be tappable if wrapped with gesture)
      final containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);
    });

    testWidgets('should handle theme changes', (WidgetTester tester) async {
      // Test with light theme
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(body: MosaicCard(child: Text('Light Theme'))),
        ),
      );

      final lightContainer = tester.widget<Container>(find.byType(Container));
      final lightDecoration = lightContainer.decoration as BoxDecoration;
      expect(lightDecoration.color, Colors.black); // Should always be black

      // Test with dark theme
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: const Scaffold(body: MosaicCard(child: Text('Dark Theme'))),
        ),
      );

      final darkContainer = tester.widget<Container>(find.byType(Container));
      final darkDecoration = darkContainer.decoration as BoxDecoration;
      expect(darkDecoration.color, Colors.black); // Should always be black
    });

    testWidgets('should render consistently across rebuilds', (
      WidgetTester tester,
    ) async {
      String content = 'Initial Content';

      Widget buildMosaicCard() {
        return MaterialApp(
          home: Scaffold(body: MosaicCard(child: Text(content))),
        );
      }

      await tester.pumpWidget(buildMosaicCard());
      expect(find.text('Initial Content'), findsOneWidget);

      // Change content and rebuild
      content = 'Updated Content';
      await tester.pumpWidget(buildMosaicCard());
      expect(find.text('Updated Content'), findsOneWidget);
      expect(find.text('Initial Content'), findsNothing);

      // Verify styling remains consistent
      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, Colors.black);
      expect(decoration.borderRadius, BorderRadius.circular(10.0));
    });

    group('Visual properties', () {
      testWidgets('should have correct border radius value', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(body: MosaicCard(child: Text('Test'))),
          ),
        );

        final container = tester.widget<Container>(find.byType(Container));
        final decoration = container.decoration as BoxDecoration;
        final borderRadius = decoration.borderRadius as BorderRadius;

        expect(borderRadius.topLeft.x, 10.0);
        expect(borderRadius.topRight.x, 10.0);
        expect(borderRadius.bottomLeft.x, 10.0);
        expect(borderRadius.bottomRight.x, 10.0);
      });

      testWidgets('should have correct shadow properties', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(body: MosaicCard(child: Text('Test'))),
          ),
        );

        final container = tester.widget<Container>(find.byType(Container));
        final decoration = container.decoration as BoxDecoration;
        final shadow = decoration.boxShadow!.first;

        expect(shadow.color, Colors.grey.withAlpha(alpha50));
        expect(shadow.spreadRadius, 3.0);
        expect(shadow.blurRadius, 7.0);
        expect(shadow.offset.dx, 0.0);
        expect(shadow.offset.dy, 3.0);
      });
    });
  });
}
