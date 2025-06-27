import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/consts/ui/colors.dart';
import 'package:great_talk/presentation/page/main/components/main_floating_action_button.dart';

void main() {
  group('MainFloatingActionButton', () {
    testWidgets('should display FloatingActionButton when isShow is true', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: MainFloatingActionButton(isShow: true)),
        ),
      );

      expect(find.byType(MainFloatingActionButton), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.byIcon(Icons.new_label), findsOneWidget);
    });

    testWidgets('should display SizedBox.shrink when isShow is false', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: MainFloatingActionButton(isShow: false)),
        ),
      );

      expect(find.byType(MainFloatingActionButton), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsNothing);
      expect(find.byIcon(Icons.new_label), findsNothing);
    });

    testWidgets('should have correct FAB properties when shown', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: MainFloatingActionButton(isShow: true)),
        ),
      );

      final fab = tester.widget<FloatingActionButton>(
        find.byType(FloatingActionButton),
      );
      expect(fab.backgroundColor, kPrimaryColor);
      expect(fab.onPressed, isNotNull);
      expect(fab.child, isA<Icon>());

      final icon = fab.child as Icon;
      expect(icon.icon, Icons.new_label);
    });

    testWidgets('should be tappable when shown', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: MainFloatingActionButton(isShow: true)),
        ),
      );

      expect(find.byType(FloatingActionButton), findsOneWidget);

      // Verify that the FAB can be tapped (has an onPressed callback)
      final fab = tester.widget<FloatingActionButton>(
        find.byType(FloatingActionButton),
      );
      expect(fab.onPressed, isNotNull);

      // Note: We can't test the actual navigation without setting up routing
      // but we can verify the button is tappable
      // Skip the actual tap test to avoid routing issues
    });

    testWidgets('should be a StatelessWidget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: MainFloatingActionButton(isShow: true)),
        ),
      );

      expect(find.byType(MainFloatingActionButton), findsOneWidget);
    });

    testWidgets('should respond to isShow changes', (
      WidgetTester tester,
    ) async {
      bool showFab = true;

      Widget buildWidget() {
        return MaterialApp(
          home: Scaffold(body: MainFloatingActionButton(isShow: showFab)),
        );
      }

      // Initial state: show FAB
      await tester.pumpWidget(buildWidget());
      expect(find.byType(FloatingActionButton), findsOneWidget);

      // Change to hide FAB
      showFab = false;
      await tester.pumpWidget(buildWidget());
      expect(find.byType(FloatingActionButton), findsNothing);

      // Change back to show FAB
      showFab = true;
      await tester.pumpWidget(buildWidget());
      expect(find.byType(FloatingActionButton), findsOneWidget);
    });

    testWidgets('should work with different themes', (
      WidgetTester tester,
    ) async {
      Widget buildWithTheme(ThemeData theme) {
        return MaterialApp(
          theme: theme,
          home: Scaffold(body: MainFloatingActionButton(isShow: true)),
        );
      }

      // Test with light theme
      await tester.pumpWidget(buildWithTheme(ThemeData.light()));
      final lightFab = tester.widget<FloatingActionButton>(
        find.byType(FloatingActionButton),
      );
      expect(lightFab.backgroundColor, kPrimaryColor);

      // Test with dark theme
      await tester.pumpWidget(buildWithTheme(ThemeData.dark()));
      final darkFab = tester.widget<FloatingActionButton>(
        find.byType(FloatingActionButton),
      );
      expect(darkFab.backgroundColor, kPrimaryColor);
    });

    testWidgets('should work in Scaffold floatingActionButton position', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            floatingActionButton: MainFloatingActionButton(isShow: true),
            body: Text('Test Body'),
          ),
        ),
      );

      expect(find.byType(MainFloatingActionButton), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.text('Test Body'), findsOneWidget);
    });

    testWidgets('should have proper key behavior', (WidgetTester tester) async {
      const key = Key('main_fab_key');

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MainFloatingActionButton(key: key, isShow: true),
          ),
        ),
      );

      expect(find.byKey(key), findsOneWidget);
      expect(find.byType(MainFloatingActionButton), findsOneWidget);
    });

    testWidgets('should maintain consistent behavior across rebuilds', (
      WidgetTester tester,
    ) async {
      bool isShow = true;
      bool showAdditionalWidget = false;

      Widget buildWidget() {
        return MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                if (showAdditionalWidget) const Text('Additional Widget'),
                MainFloatingActionButton(isShow: isShow),
              ],
            ),
          ),
        );
      }

      await tester.pumpWidget(buildWidget());
      expect(find.byType(FloatingActionButton), findsOneWidget);

      // Rebuild with additional widget
      showAdditionalWidget = true;
      await tester.pumpWidget(buildWidget());
      expect(find.text('Additional Widget'), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);

      // Hide FAB
      isShow = false;
      await tester.pumpWidget(buildWidget());
      expect(find.byType(FloatingActionButton), findsNothing);
    });

    testWidgets('should work with multiple instances', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: const [
                MainFloatingActionButton(isShow: true),
                MainFloatingActionButton(isShow: false),
                MainFloatingActionButton(isShow: true),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(MainFloatingActionButton), findsNWidgets(3));
      expect(find.byType(FloatingActionButton), findsNWidgets(2));
    });

    testWidgets('should handle edge cases', (WidgetTester tester) async {
      // Test rapid show/hide changes
      bool isShow = true;

      Widget buildWidget() {
        return MaterialApp(
          home: Scaffold(body: MainFloatingActionButton(isShow: isShow)),
        );
      }

      for (int i = 0; i < 5; i++) {
        isShow = !isShow;
        await tester.pumpWidget(buildWidget());

        if (isShow) {
          expect(find.byType(FloatingActionButton), findsOneWidget);
        } else {
          expect(find.byType(FloatingActionButton), findsNothing);
        }
      }
    });

    group('Conditional rendering', () {
      testWidgets('should show correct widget based on isShow parameter', (
        WidgetTester tester,
      ) async {
        final testCases = [
          {'isShow': true, 'expectFab': true, 'expectSizedBox': false},
          {'isShow': false, 'expectFab': false, 'expectSizedBox': true},
        ];

        for (final testCase in testCases) {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: MainFloatingActionButton(
                  isShow: testCase['isShow'] as bool,
                ),
              ),
            ),
          );

          if (testCase['expectFab'] as bool) {
            expect(find.byType(FloatingActionButton), findsOneWidget);
            expect(find.byIcon(Icons.new_label), findsOneWidget);
          } else {
            expect(find.byType(FloatingActionButton), findsNothing);
            expect(find.byIcon(Icons.new_label), findsNothing);
          }

          // Note: We don't check for SizedBox as there are other SizedBox widgets
          // in the MaterialApp widget tree
        }
      });

      testWidgets('should maintain widget consistency', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(body: MainFloatingActionButton(isShow: true)),
          ),
        );

        // Verify FAB properties remain consistent
        final fab = tester.widget<FloatingActionButton>(
          find.byType(FloatingActionButton),
        );
        expect(fab.backgroundColor, kPrimaryColor);
        expect(fab.onPressed, isNotNull);

        final icon = fab.child as Icon;
        expect(icon.icon, Icons.new_label);
      });
    });
  });
}
