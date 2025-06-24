import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/views/components/text_field_container.dart';

void main() {
  group('TextFieldContainer', () {
    testWidgets('should render with correct structure and child', (
      WidgetTester tester,
    ) async {
      const childWidget = Text('Test Child');

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: TextFieldContainer(child: childWidget)),
        ),
      );

      expect(find.byType(TextFieldContainer), findsOneWidget);
      expect(find.byType(Center), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
      expect(find.text('Test Child'), findsOneWidget);
    });

    testWidgets('should have correct default width ratio', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: TextFieldContainer(child: Text('Test'))),
        ),
      );

      final containerSize = tester.getSize(find.byType(Container));
      final mediaQuery = MediaQuery.of(tester.element(find.byType(Scaffold)));
      final expectedWidth = mediaQuery.size.width * 0.9;

      expect(containerSize.width, expectedWidth);
    });

    testWidgets('should apply correct styling', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: TextFieldContainer(child: Text('Test'))),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;

      expect(decoration.border, isNotNull);
      expect(decoration.borderRadius, isNotNull);
      expect(decoration.borderRadius, isA<BorderRadius>());

      final borderRadius = decoration.borderRadius as BorderRadius;
      expect(borderRadius.topLeft.x, 8.0);
      expect(borderRadius.topRight.x, 8.0);
      expect(borderRadius.bottomLeft.x, 8.0);
      expect(borderRadius.bottomRight.x, 8.0);
    });

    testWidgets('should use theme focus color for border', (
      WidgetTester tester,
    ) async {
      const focusColor = Colors.red;

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(focusColor: focusColor),
          home: const Scaffold(body: TextFieldContainer(child: Text('Test'))),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      final border = decoration.border as Border;

      expect(border.top.color, focusColor);
      expect(border.bottom.color, focusColor);
      expect(border.left.color, focusColor);
      expect(border.right.color, focusColor);
    });

    testWidgets('should have correct margin from SizeCore', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: TextFieldContainer(child: Text('Test'))),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final margin = container.margin as EdgeInsets;

      expect(margin.left, 0);
      expect(margin.right, 0);
      expect(margin.top, greaterThan(0));
      expect(margin.bottom, greaterThan(0));
      expect(margin.top, equals(margin.bottom));
    });

    testWidgets('should respond to screen size changes', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: TextFieldContainer(child: Text('Test'))),
        ),
      );

      final containerSize = tester.getSize(find.byType(Container));
      final mediaQuery = MediaQuery.of(tester.element(find.byType(Scaffold)));
      final expectedWidth = mediaQuery.size.width * 0.9;

      expect(containerSize.width, expectedWidth);

      final ratio = containerSize.width / mediaQuery.size.width;
      expect(ratio, closeTo(0.9, 0.01));
    });

    testWidgets('should work with different child widgets', (
      WidgetTester tester,
    ) async {
      final textField = TextField(
        decoration: const InputDecoration(
          hintText: 'Enter text',
          border: InputBorder.none,
        ),
      );

      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: TextFieldContainer(child: textField))),
      );

      expect(find.byType(TextField), findsOneWidget);
      expect(find.byType(TextFieldContainer), findsOneWidget);
    });

    testWidgets('should maintain child widget properties', (
      WidgetTester tester,
    ) async {
      const key = Key('child_key');
      const childWidget = Text('Child Text', key: key);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: TextFieldContainer(child: childWidget)),
        ),
      );

      expect(find.byKey(key), findsOneWidget);
      expect(find.text('Child Text'), findsOneWidget);
    });

    testWidgets('should be centered in parent', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: TextFieldContainer(child: Text('Test'))),
        ),
      );

      final center = tester.widget<Center>(find.byType(Center));
      expect(center.child, isA<Container>());
    });

    testWidgets('should have consistent key behavior', (
      WidgetTester tester,
    ) async {
      const key = Key('container_key');

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TextFieldContainer(key: key, child: Text('Test')),
          ),
        ),
      );

      expect(find.byKey(key), findsOneWidget);
      expect(find.byType(TextFieldContainer), findsOneWidget);
    });

    testWidgets('should work with complex child layouts', (
      WidgetTester tester,
    ) async {
      final complexChild = Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              hintText: 'Username',
              border: InputBorder.none,
            ),
          ),
          const Divider(),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Password',
              border: InputBorder.none,
            ),
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: TextFieldContainer(child: complexChild)),
        ),
      );

      expect(find.byType(TextField), findsNWidgets(2));
      expect(find.byType(Divider), findsOneWidget);
      expect(find.byType(TextFieldContainer), findsOneWidget);
    });

    testWidgets('should maintain consistent styling across rebuilds', (
      WidgetTester tester,
    ) async {
      bool toggle = false;

      Widget buildWidget() {
        return MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                if (toggle) const Text('Additional widget'),
                const TextFieldContainer(child: Text('Test')),
              ],
            ),
          ),
        );
      }

      await tester.pumpWidget(buildWidget());

      final container1 = tester.widget<Container>(find.byType(Container));
      final decoration1 = container1.decoration as BoxDecoration;

      toggle = true;
      await tester.pumpWidget(buildWidget());

      final container2 = tester.widget<Container>(find.byType(Container));
      final decoration2 = container2.decoration as BoxDecoration;

      final size1 = tester.getSize(find.byType(Container));

      toggle = true;
      await tester.pumpWidget(buildWidget());

      final size2 = tester.getSize(find.byType(Container));
      expect(size1.width, equals(size2.width));
      expect(decoration1.borderRadius, equals(decoration2.borderRadius));
    });

    testWidgets('should work in different layout contexts', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ListView(
              children: [
                const TextFieldContainer(child: Text('Item 1')),
                const TextFieldContainer(child: Text('Item 2')),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(TextFieldContainer), findsNWidgets(2));
      expect(find.text('Item 1'), findsOneWidget);
      expect(find.text('Item 2'), findsOneWidget);
    });
  });
}
