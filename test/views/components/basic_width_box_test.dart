import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/views/components/basic_width_box.dart';

void main() {
  group('BasicWidthBox', () {
    testWidgets('should render SizedBox with correct width', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: BasicWidthBox(),
          ),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.width, 20.0);
      expect(sizedBox.height, isNull);
    });

    testWidgets('should be a StatelessWidget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: BasicWidthBox(),
          ),
        ),
      );

      expect(find.byType(BasicWidthBox), findsOneWidget);
      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('should take up correct space in layout', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Row(
              children: [
                Container(width: 50, height: 50, color: Colors.red),
                const BasicWidthBox(),
                Container(width: 50, height: 50, color: Colors.blue),
              ],
            ),
          ),
        ),
      );

      final row = tester.widget<Row>(find.byType(Row));
      expect(row.children.length, 3);
      
      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.width, 20.0);
    });

    testWidgets('should maintain consistent size across rebuilds', (WidgetTester tester) async {
      bool toggle = false;
      
      Widget buildWidget() {
        return MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                if (toggle) const Text('Additional widget'),
                const BasicWidthBox(),
              ],
            ),
          ),
        );
      }

      await tester.pumpWidget(buildWidget());
      
      final sizedBox1 = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox1.width, 20.0);

      toggle = true;
      await tester.pumpWidget(buildWidget());
      
      final sizedBox2 = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox2.width, 20.0);
    });

    testWidgets('should work in different parent widgets', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                const BasicWidthBox(),
                Container(height: 100),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(BasicWidthBox), findsOneWidget);
      expect(find.byType(SizedBox), findsOneWidget);
      
      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.width, 20.0);
    });

    testWidgets('should have consistent key behavior', (WidgetTester tester) async {
      const key = Key('test_key');
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: BasicWidthBox(key: key),
          ),
        ),
      );

      expect(find.byKey(key), findsOneWidget);
      expect(find.byType(BasicWidthBox), findsOneWidget);
    });

    testWidgets('should work with multiple instances', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Row(
              children: [
                Container(width: 10, height: 10, color: Colors.red),
                const BasicWidthBox(),
                Container(width: 10, height: 10, color: Colors.green),
                const BasicWidthBox(),
                Container(width: 10, height: 10, color: Colors.blue),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(BasicWidthBox), findsNWidgets(2));
      expect(find.byType(SizedBox), findsNWidgets(2));
      
      final sizedBoxes = tester.widgetList<SizedBox>(find.byType(SizedBox));
      for (final sizedBox in sizedBoxes) {
        expect(sizedBox.width, 20.0);
      }
    });
  });
}