import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/views/components/official_mark.dart';

void main() {
  group('OfficialMark', () {
    testWidgets('should render verified icon with correct properties', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: OfficialMark(),
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byType(Icon));
      expect(icon.icon, Icons.verified);
      expect(icon.size, 30.0);
      expect(icon.color, isNotNull);
    });

    testWidgets('should be a StatelessWidget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: OfficialMark(),
          ),
        ),
      );

      expect(find.byType(OfficialMark), findsOneWidget);
      expect(find.byType(Icon), findsOneWidget);
      expect(find.byIcon(Icons.verified), findsOneWidget);
    });

    testWidgets('should use theme primary color', (WidgetTester tester) async {
      const primaryColor = Colors.red;
      
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            colorScheme: const ColorScheme.light(primary: primaryColor),
          ),
          home: const Scaffold(
            body: OfficialMark(),
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byType(Icon));
      expect(icon.color, primaryColor);
    });

    testWidgets('should have color from theme', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: OfficialMark(),
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byType(Icon));
      expect(icon.color, isNotNull);
      expect(icon.icon, Icons.verified);
      expect(icon.size, 30.0);
    });

    testWidgets('should maintain consistent size across different themes', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: OfficialMark(),
          ),
        ),
      );

      final lightIcon = tester.widget<Icon>(find.byType(Icon));
      expect(lightIcon.size, 30.0);

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: const Scaffold(
            body: OfficialMark(),
          ),
        ),
      );

      final darkIcon = tester.widget<Icon>(find.byType(Icon));
      expect(darkIcon.size, 30.0);
    });

    testWidgets('should work in different parent widgets', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Row(
              children: [
                const Text('User Name'),
                const SizedBox(width: 8),
                const OfficialMark(),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(OfficialMark), findsOneWidget);
      expect(find.byIcon(Icons.verified), findsOneWidget);
      expect(find.text('User Name'), findsOneWidget);
    });

    testWidgets('should have consistent key behavior', (WidgetTester tester) async {
      const key = Key('official_mark_key');
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: OfficialMark(key: key),
          ),
        ),
      );

      expect(find.byKey(key), findsOneWidget);
      expect(find.byType(OfficialMark), findsOneWidget);
    });

    testWidgets('should work with multiple instances', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                Row(
                  children: [
                    const Text('User 1'),
                    const OfficialMark(),
                  ],
                ),
                Row(
                  children: [
                    const Text('User 2'),
                    const OfficialMark(),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(OfficialMark), findsNWidgets(2));
      expect(find.byIcon(Icons.verified), findsNWidgets(2));
      
      final icons = tester.widgetList<Icon>(find.byType(Icon));
      for (final icon in icons) {
        expect(icon.icon, Icons.verified);
        expect(icon.size, 30.0);
      }
    });

    testWidgets('should maintain visual consistency', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: OfficialMark(),
          ),
        ),
      );

      final iconFinder = find.byIcon(Icons.verified);
      expect(iconFinder, findsOneWidget);
      
      final iconWidget = tester.widget<Icon>(iconFinder);
      expect(iconWidget.icon, Icons.verified);
      expect(iconWidget.size, 30.0);
      expect(iconWidget.color, isNotNull);
    });

    testWidgets('should be semantically accessible', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: OfficialMark(),
          ),
        ),
      );

      expect(find.byIcon(Icons.verified), findsOneWidget);
      
      final iconWidget = tester.widget<Icon>(find.byType(Icon));
      expect(iconWidget.semanticLabel, isNull);
    });

    testWidgets('should render correctly in different screen sizes', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(400, 600));
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: OfficialMark(),
          ),
        ),
      );

      final smallScreenIcon = tester.widget<Icon>(find.byType(Icon));
      expect(smallScreenIcon.size, 30.0);

      await tester.binding.setSurfaceSize(const Size(800, 1200));
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: OfficialMark(),
          ),
        ),
      );

      final largeScreenIcon = tester.widget<Icon>(find.byType(Icon));
      expect(largeScreenIcon.size, 30.0);

      await tester.binding.setSurfaceSize(null);
    });
  });
}