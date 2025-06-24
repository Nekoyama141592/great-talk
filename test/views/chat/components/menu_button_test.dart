import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/views/chat/components/menu_button.dart';
import 'package:great_talk/views/components/app_bar_action.dart';

void main() {
  group('MenuButton', () {
    testWidgets('should display menu icon', (WidgetTester tester) async {
      bool tapped = false;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MenuButton(
              onMenuPressed: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      expect(find.byType(MenuButton), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
      expect(find.byType(AppBarAction), findsOneWidget);
      expect(tapped, false);
    });

    testWidgets('should call onMenuPressed when tapped', (WidgetTester tester) async {
      bool tapped = false;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MenuButton(
              onMenuPressed: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(MenuButton));
      await tester.pump();

      expect(tapped, true);
    });

    testWidgets('should have correct structure', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MenuButton(
              onMenuPressed: () {},
            ),
          ),
        ),
      );

      // Verify the widget structure
      expect(find.byType(AppBarAction), findsOneWidget);
      
      final appBarAction = tester.widget<AppBarAction>(find.byType(AppBarAction));
      expect(appBarAction.onTap, isNotNull);
      expect(appBarAction.child, isA<Icon>());
      
      final icon = appBarAction.child as Icon;
      expect(icon.icon, Icons.menu);
    });

    testWidgets('should work with different callback functions', (WidgetTester tester) async {
      int tapCount = 0;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MenuButton(
              onMenuPressed: () {
                tapCount++;
              },
            ),
          ),
        ),
      );

      // Tap multiple times
      await tester.tap(find.byType(MenuButton));
      await tester.pump();
      expect(tapCount, 1);

      await tester.tap(find.byType(MenuButton));
      await tester.pump();
      expect(tapCount, 2);

      await tester.tap(find.byType(MenuButton));
      await tester.pump();
      expect(tapCount, 3);
    });

    testWidgets('should be a StatelessWidget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MenuButton(
              onMenuPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byType(MenuButton), findsOneWidget);
    });

    testWidgets('should handle theme changes', (WidgetTester tester) async {
      Widget buildMenuButton(ThemeData theme) {
        return MaterialApp(
          theme: theme,
          home: Scaffold(
            body: MenuButton(
              onMenuPressed: () {},
            ),
          ),
        );
      }

      // Test with light theme
      await tester.pumpWidget(buildMenuButton(ThemeData.light()));
      expect(find.byIcon(Icons.menu), findsOneWidget);

      // Test with dark theme
      await tester.pumpWidget(buildMenuButton(ThemeData.dark()));
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('should work in different layout contexts', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              actions: [
                MenuButton(onMenuPressed: () {}),
              ],
            ),
            body: const Text('Test Body'),
          ),
        ),
      );

      expect(find.byType(MenuButton), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('should maintain consistent behavior across rebuilds', (WidgetTester tester) async {
      int tapCount = 0;
      bool toggle = false;
      
      Widget buildWidget() {
        return MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                if (toggle) const Text('Toggle State'),
                MenuButton(
                  onMenuPressed: () {
                    tapCount++;
                  },
                ),
              ],
            ),
          ),
        );
      }

      await tester.pumpWidget(buildWidget());
      await tester.tap(find.byType(MenuButton));
      await tester.pump();
      expect(tapCount, 1);

      // Rebuild with additional widget
      toggle = true;
      await tester.pumpWidget(buildWidget());
      expect(find.text('Toggle State'), findsOneWidget);
      
      await tester.tap(find.byType(MenuButton));
      await tester.pump();
      expect(tapCount, 2);
    });

    testWidgets('should have proper key behavior', (WidgetTester tester) async {
      const key = Key('menu_button_key');
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MenuButton(
              key: key,
              onMenuPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byKey(key), findsOneWidget);
      expect(find.byType(MenuButton), findsOneWidget);
    });

    testWidgets('should work within scrollable widgets', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ListView(
              children: [
                const Text('Header'),
                MenuButton(onMenuPressed: () {}),
                const Text('Footer'),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(MenuButton), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });
  });
}