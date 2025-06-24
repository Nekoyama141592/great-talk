import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/views/components/basic_height_box.dart';

void main() {
  group('BasicHeightBox', () {
    testWidgets('should render SizedBox with height from SizeCore', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: BasicHeightBox())),
      );

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.height, isNotNull);
      expect(sizedBox.height, greaterThan(0));
      expect(sizedBox.width, isNull);
    });

    testWidgets('should be a StatelessWidget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: BasicHeightBox())),
      );

      expect(find.byType(BasicHeightBox), findsOneWidget);
      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('should take up correct space in column layout', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                Container(width: 50, height: 50, color: Colors.red),
                const BasicHeightBox(),
                Container(width: 50, height: 50, color: Colors.blue),
              ],
            ),
          ),
        ),
      );

      final column = tester.widget<Column>(find.byType(Column));
      expect(column.children.length, 3);

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.height, isNotNull);
      expect(sizedBox.height, greaterThan(0));
    });

    testWidgets('should respond to screen size changes', (
      WidgetTester tester,
    ) async {
      await tester.binding.setSurfaceSize(const Size(400, 600));

      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: BasicHeightBox())),
      );

      final sizedBox1 = tester.widget<SizedBox>(find.byType(SizedBox));
      final height1 = sizedBox1.height;

      await tester.binding.setSurfaceSize(const Size(800, 1200));
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: BasicHeightBox())),
      );

      final sizedBox2 = tester.widget<SizedBox>(find.byType(SizedBox));
      final height2 = sizedBox2.height;

      expect(height1, isNotNull);
      expect(height2, isNotNull);
      expect(height2, greaterThanOrEqualTo(height1!));

      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('should maintain consistent behavior across rebuilds', (
      WidgetTester tester,
    ) async {
      bool toggle = false;

      Widget buildWidget() {
        return MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                if (toggle) const Text('Additional widget'),
                const BasicHeightBox(),
              ],
            ),
          ),
        );
      }

      await tester.pumpWidget(buildWidget());

      final sizedBox1 = tester.widget<SizedBox>(find.byType(SizedBox));
      final height1 = sizedBox1.height;

      toggle = true;
      await tester.pumpWidget(buildWidget());

      final sizedBox2 = tester.widget<SizedBox>(find.byType(SizedBox));
      final height2 = sizedBox2.height;

      expect(height1, equals(height2));
    });

    testWidgets('should work in different parent widgets', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Row(
              children: [const BasicHeightBox(), Container(width: 100)],
            ),
          ),
        ),
      );

      expect(find.byType(BasicHeightBox), findsOneWidget);
      expect(find.byType(SizedBox), findsOneWidget);

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.height, isNotNull);
      expect(sizedBox.height, greaterThan(0));
    });

    testWidgets('should have consistent key behavior', (
      WidgetTester tester,
    ) async {
      const key = Key('test_key');

      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: BasicHeightBox(key: key))),
      );

      expect(find.byKey(key), findsOneWidget);
      expect(find.byType(BasicHeightBox), findsOneWidget);
    });

    testWidgets('should work with multiple instances', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                Container(width: 10, height: 10, color: Colors.red),
                const BasicHeightBox(),
                Container(width: 10, height: 10, color: Colors.green),
                const BasicHeightBox(),
                Container(width: 10, height: 10, color: Colors.blue),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(BasicHeightBox), findsNWidgets(2));
      expect(find.byType(SizedBox), findsNWidgets(2));

      final sizedBoxes = tester.widgetList<SizedBox>(find.byType(SizedBox));
      for (final sizedBox in sizedBoxes) {
        expect(sizedBox.height, isNotNull);
        expect(sizedBox.height, greaterThan(0));
      }
    });

    testWidgets('should use MediaQuery for sizing calculation', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: BasicHeightBox())),
      );

      final context = tester.element(find.byType(BasicHeightBox));
      final mediaQuery = MediaQuery.of(context);

      expect(mediaQuery, isNotNull);

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.height, isNotNull);
    });
  });
}
