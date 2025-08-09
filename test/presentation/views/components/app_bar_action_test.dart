import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/presentation/component/app_bar_action.dart';

void main() {
  group('AppBarAction', () {
    testWidgets('should render with correct padding and child', (
      WidgetTester tester,
    ) async {
      const childWidget = Icon(Icons.menu);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: AppBarAction(onTap: () {}, child: childWidget)),
        ),
      );

      expect(find.byType(AppBarAction), findsOneWidget);
      expect(find.byType(Padding), findsOneWidget);
      expect(find.byType(InkWell), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);

      final padding = tester.widget<Padding>(find.byType(Padding));
      expect(padding.padding, const EdgeInsets.only(right: 10.0));
    });

    testWidgets('should call onTap when tapped', (WidgetTester tester) async {
      bool wasTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppBarAction(
              onTap: () {
                wasTapped = true;
              },
              child: const Icon(Icons.menu),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(InkWell));
      await tester.pump();

      expect(wasTapped, true);
    });

    testWidgets('should handle null onTap', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppBarAction(onTap: null, child: Icon(Icons.menu)),
          ),
        ),
      );

      final inkWell = tester.widget<InkWell>(find.byType(InkWell));
      expect(inkWell.onTap, isNull);
    });

    testWidgets('should render different child widgets', (
      WidgetTester tester,
    ) async {
      const textChild = Text('Action');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: AppBarAction(onTap: () {}, child: textChild)),
        ),
      );

      expect(find.text('Action'), findsOneWidget);
      expect(find.byType(AppBarAction), findsOneWidget);
    });

    testWidgets('should maintain tap functionality across rebuilds', (
      WidgetTester tester,
    ) async {
      int tapCount = 0;
      bool toggle = false;

      Widget buildWidget() {
        return MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                if (toggle) const Text('Additional widget'),
                AppBarAction(
                  onTap: () {
                    tapCount++;
                  },
                  child: const Icon(Icons.menu),
                ),
              ],
            ),
          ),
        );
      }

      await tester.pumpWidget(buildWidget());

      await tester.tap(find.byType(InkWell));
      await tester.pump();
      expect(tapCount, 1);

      toggle = true;
      await tester.pumpWidget(buildWidget());

      await tester.tap(find.byType(InkWell));
      await tester.pump();
      expect(tapCount, 2);
    });

    testWidgets('should work with complex child widgets', (
      WidgetTester tester,
    ) async {
      bool wasTapped = false;

      final complexChild = const Row(
        mainAxisSize: MainAxisSize.min,
        children: [Icon(Icons.person), SizedBox(width: 4), Text('Profile')],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppBarAction(
              onTap: () {
                wasTapped = true;
              },
              child: complexChild,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.person), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);

      await tester.tap(find.byType(InkWell));
      await tester.pump();

      expect(wasTapped, true);
    });

    testWidgets('should have consistent key behavior', (
      WidgetTester tester,
    ) async {
      const key = Key('app_bar_action_key');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppBarAction(
              key: key,
              onTap: () {},
              child: const Icon(Icons.menu),
            ),
          ),
        ),
      );

      expect(find.byKey(key), findsOneWidget);
      expect(find.byType(AppBarAction), findsOneWidget);
    });

    testWidgets('should work with multiple instances', (
      WidgetTester tester,
    ) async {
      int firstTapCount = 0;
      int secondTapCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Row(
              children: [
                AppBarAction(
                  onTap: () {
                    firstTapCount++;
                  },
                  child: const Icon(Icons.menu),
                ),
                AppBarAction(
                  onTap: () {
                    secondTapCount++;
                  },
                  child: const Icon(Icons.search),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(AppBarAction), findsNWidgets(2));
      expect(find.byType(InkWell), findsNWidgets(2));

      await tester.tap(find.byIcon(Icons.menu));
      await tester.pump();
      expect(firstTapCount, 1);
      expect(secondTapCount, 0);

      await tester.tap(find.byIcon(Icons.search));
      await tester.pump();
      expect(firstTapCount, 1);
      expect(secondTapCount, 1);
    });

    testWidgets('should handle rapid taps', (WidgetTester tester) async {
      int tapCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppBarAction(
              onTap: () {
                tapCount++;
              },
              child: const Icon(Icons.menu),
            ),
          ),
        ),
      );

      for (int i = 0; i < 5; i++) {
        await tester.tap(find.byType(InkWell));
        await tester.pump(const Duration(milliseconds: 10));
      }

      expect(tapCount, 5);
    });

    testWidgets('should apply padding correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppBarAction(onTap: () {}, child: const Icon(Icons.menu)),
          ),
        ),
      );

      final padding = tester.widget<Padding>(find.byType(Padding));
      expect(padding.padding, const EdgeInsets.only(right: 10.0));

      final paddingBox = tester.getRect(find.byType(Padding));
      final inkWellBox = tester.getRect(find.byType(InkWell));

      expect(paddingBox.width, greaterThan(inkWellBox.width));
      expect(paddingBox.right - inkWellBox.right, 10.0);
    });

    testWidgets('should be semantically accessible', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppBarAction(onTap: () {}, child: const Icon(Icons.menu)),
          ),
        ),
      );

      expect(find.byType(InkWell), findsOneWidget);

      final inkWell = tester.widget<InkWell>(find.byType(InkWell));
      expect(inkWell.onTap, isNotNull);
    });

    testWidgets('should work in AppBar context', (WidgetTester tester) async {
      bool wasTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              actions: [
                AppBarAction(
                  onTap: () {
                    wasTapped = true;
                  },
                  child: const Icon(Icons.settings),
                ),
              ],
            ),
            body: const Center(child: Text('Content')),
          ),
        ),
      );

      expect(find.byIcon(Icons.settings), findsOneWidget);

      await tester.tap(find.byType(InkWell));
      await tester.pump();

      expect(wasTapped, true);
    });
  });
}
