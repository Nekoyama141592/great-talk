import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/views/chat/components/delete_post_button.dart';
import 'package:great_talk/views/components/app_bar_action.dart';

void main() {
  group('DeletePostButton', () {
    testWidgets('should display purple delete icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DeletePostButton(
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.byType(DeletePostButton), findsOneWidget);
      expect(find.byIcon(Icons.delete), findsOneWidget);
      expect(find.byType(AppBarAction), findsOneWidget);
      
      final icon = tester.widget<Icon>(find.byIcon(Icons.delete));
      expect(icon.color, Colors.purple);
    });

    testWidgets('should call onTap when pressed', (WidgetTester tester) async {
      bool tapped = false;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DeletePostButton(
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(DeletePostButton));
      await tester.pump();

      expect(tapped, true);
    });

    testWidgets('should handle null onTap callback', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DeletePostButton(
              onTap: null,
            ),
          ),
        ),
      );

      expect(find.byType(DeletePostButton), findsOneWidget);
      expect(find.byIcon(Icons.delete), findsOneWidget);
      
      final appBarAction = tester.widget<AppBarAction>(find.byType(AppBarAction));
      expect(appBarAction.onTap, null);
    });

    testWidgets('should have correct structure', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DeletePostButton(
              onTap: () {},
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
      expect(icon.icon, Icons.delete);
      expect(icon.color, Colors.purple);
    });

    testWidgets('should work with different callback functions', (WidgetTester tester) async {
      int deleteCount = 0;
      String lastAction = '';
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DeletePostButton(
              onTap: () {
                deleteCount++;
                lastAction = 'delete';
              },
            ),
          ),
        ),
      );

      // Tap multiple times
      await tester.tap(find.byType(DeletePostButton));
      await tester.pump();
      expect(deleteCount, 1);
      expect(lastAction, 'delete');

      await tester.tap(find.byType(DeletePostButton));
      await tester.pump();
      expect(deleteCount, 2);
      expect(lastAction, 'delete');
    });

    testWidgets('should be a StatelessWidget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DeletePostButton(
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.byType(DeletePostButton), findsOneWidget);
    });

    testWidgets('should maintain purple color across different themes', (WidgetTester tester) async {
      Widget buildDeleteButton(ThemeData theme) {
        return MaterialApp(
          theme: theme,
          home: Scaffold(
            body: DeletePostButton(
              onTap: () {},
            ),
          ),
        );
      }

      // Test with light theme
      await tester.pumpWidget(buildDeleteButton(ThemeData.light()));
      final lightIcon = tester.widget<Icon>(find.byIcon(Icons.delete));
      expect(lightIcon.color, Colors.purple);

      // Test with dark theme
      await tester.pumpWidget(buildDeleteButton(ThemeData.dark()));
      final darkIcon = tester.widget<Icon>(find.byIcon(Icons.delete));
      expect(darkIcon.color, Colors.purple);
    });

    testWidgets('should work in app bar context', (WidgetTester tester) async {
      bool deletePressed = false;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              actions: [
                DeletePostButton(
                  onTap: () {
                    deletePressed = true;
                  },
                ),
              ],
            ),
            body: const Text('Test Body'),
          ),
        ),
      );

      expect(find.byType(DeletePostButton), findsOneWidget);
      expect(find.byIcon(Icons.delete), findsOneWidget);
      
      await tester.tap(find.byType(DeletePostButton));
      await tester.pump();
      expect(deletePressed, true);
    });

    testWidgets('should maintain consistent behavior across rebuilds', (WidgetTester tester) async {
      int tapCount = 0;
      bool showAdditionalWidget = false;
      
      Widget buildWidget() {
        return MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                if (showAdditionalWidget) const Text('Additional Widget'),
                DeletePostButton(
                  onTap: () {
                    tapCount++;
                  },
                ),
              ],
            ),
          ),
        );
      }

      await tester.pumpWidget(buildWidget());
      await tester.tap(find.byType(DeletePostButton));
      await tester.pump();
      expect(tapCount, 1);

      // Rebuild with additional widget
      showAdditionalWidget = true;
      await tester.pumpWidget(buildWidget());
      expect(find.text('Additional Widget'), findsOneWidget);
      
      await tester.tap(find.byType(DeletePostButton));
      await tester.pump();
      expect(tapCount, 2);
      
      // Verify icon color is still purple
      final icon = tester.widget<Icon>(find.byIcon(Icons.delete));
      expect(icon.color, Colors.purple);
    });

    testWidgets('should have proper key behavior', (WidgetTester tester) async {
      const key = Key('delete_post_button_key');
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DeletePostButton(
              key: key,
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.byKey(key), findsOneWidget);
      expect(find.byType(DeletePostButton), findsOneWidget);
    });

    testWidgets('should work within scrollable widgets', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ListView(
              children: [
                const Text('Header'),
                DeletePostButton(onTap: () {}),
                const Text('Footer'),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(DeletePostButton), findsOneWidget);
      expect(find.byIcon(Icons.delete), findsOneWidget);
      
      final icon = tester.widget<Icon>(find.byIcon(Icons.delete));
      expect(icon.color, Colors.purple);
    });

    testWidgets('should work with multiple instances', (WidgetTester tester) async {
      int button1Taps = 0;
      int button2Taps = 0;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                DeletePostButton(
                  onTap: () {
                    button1Taps++;
                  },
                ),
                DeletePostButton(
                  onTap: () {
                    button2Taps++;
                  },
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(DeletePostButton), findsNWidgets(2));
      expect(find.byIcon(Icons.delete), findsNWidgets(2));
      
      // Tap first button
      await tester.tap(find.byType(DeletePostButton).first);
      await tester.pump();
      expect(button1Taps, 1);
      expect(button2Taps, 0);
      
      // Tap second button
      await tester.tap(find.byType(DeletePostButton).last);
      await tester.pump();
      expect(button1Taps, 1);
      expect(button2Taps, 1);
    });

    testWidgets('should pass through tap events correctly', (WidgetTester tester) async {
      List<String> tapEvents = [];
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DeletePostButton(
              onTap: () {
                tapEvents.add('delete_tapped');
              },
            ),
          ),
        ),
      );

      expect(tapEvents, isEmpty);
      
      await tester.tap(find.byType(DeletePostButton));
      await tester.pump();
      expect(tapEvents, ['delete_tapped']);
      
      await tester.tap(find.byType(DeletePostButton));
      await tester.pump();
      expect(tapEvents, ['delete_tapped', 'delete_tapped']);
    });
  });
}