import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/util/size_core.dart';

void main() {
  group('SizeCore', () {
    testWidgets('should calculate correct dimensions', (
      WidgetTester tester,
    ) async {
      const screenSize = Size(400, 800);

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(size: screenSize),
                child: Scaffold(
                  body: Builder(
                    builder: (context) {
                      return Column(
                        children: [
                          Text('Full Height: ${SizeCore.fullHeight(context)}'),
                          Text('Full Width: ${SizeCore.fullWidth(context)}'),
                          Text(
                            'User Image Size: ${SizeCore.userImageSize(context)}',
                          ),
                          Text(
                            'Default Padding: ${SizeCore.defaultPadding(context)}',
                          ),
                          Text(
                            'Header Text Size: ${SizeCore.defaultHeaderTextSize(context)}',
                          ),
                          Text(
                            'Tab Text Size: ${SizeCore.defaultTabTextSize(context)}',
                          ),
                          Text(
                            'App Bar Circular: ${SizeCore.appBarCircular(context)}',
                          ),
                          Text(
                            'Search Top Padding: ${SizeCore.searchScreenTopPadding(context)}',
                          ),
                          Text(
                            'Chat Screen Height: ${SizeCore.chatScreenHeight(context)}',
                          ),
                        ],
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      );

      final context = tester.element(find.byType(Scaffold));

      expect(SizeCore.fullHeight(context), 800.0);
      expect(SizeCore.fullWidth(context), 400.0);
      expect(SizeCore.userImageSize(context), 400.0 * 0.16); // 64.0
      expect(SizeCore.defaultPadding(context), 800.0 / 100.0); // 8.0
      expect(SizeCore.defaultHeaderTextSize(context), 800.0 / 32.0); // 25.0
      expect(SizeCore.defaultTabTextSize(context), 800.0 / 50.0); // 16.0
      expect(SizeCore.appBarCircular(context), 800.0 / 25.0); // 32.0
      expect(
        SizeCore.searchScreenTopPadding(context),
        (800.0 / 100.0) * 7,
      ); // 56.0
      expect(SizeCore.chatScreenHeight(context), 800.0 * 0.7); // 560.0
    });

    testWidgets('should handle different screen sizes', (
      WidgetTester tester,
    ) async {
      const smallScreenSize = Size(300, 600);

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(size: smallScreenSize),
                child: Scaffold(
                  body: Builder(
                    builder: (context) {
                      return const Text('Test');
                    },
                  ),
                ),
              );
            },
          ),
        ),
      );

      final context = tester.element(find.byType(Scaffold));

      expect(SizeCore.fullHeight(context), 600.0);
      expect(SizeCore.fullWidth(context), 300.0);
      expect(SizeCore.userImageSize(context), 300.0 * 0.16); // 48.0
      expect(SizeCore.defaultPadding(context), 600.0 / 100.0); // 6.0
      expect(SizeCore.chatScreenHeight(context), 600.0 * 0.7); // 420.0
    });

    testWidgets('should handle large screen sizes', (
      WidgetTester tester,
    ) async {
      const largeScreenSize = Size(800, 1200);

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(size: largeScreenSize),
                child: Scaffold(
                  body: Builder(
                    builder: (context) {
                      return const Text('Test');
                    },
                  ),
                ),
              );
            },
          ),
        ),
      );

      final context = tester.element(find.byType(Scaffold));

      expect(SizeCore.fullHeight(context), 1200.0);
      expect(SizeCore.fullWidth(context), 800.0);
      expect(SizeCore.userImageSize(context), 800.0 * 0.16); // 128.0
      expect(SizeCore.defaultPadding(context), 1200.0 / 100.0); // 12.0
      expect(SizeCore.chatScreenHeight(context), 1200.0 * 0.7); // 840.0
    });

    testWidgets('should maintain proportional relationships', (
      WidgetTester tester,
    ) async {
      const screenSize = Size(400, 800);

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(size: screenSize),
                child: Scaffold(
                  body: Builder(
                    builder: (context) {
                      return const Text('Test');
                    },
                  ),
                ),
              );
            },
          ),
        ),
      );

      final context = tester.element(find.byType(Scaffold));
      final padding = SizeCore.defaultPadding(context);
      final searchPadding = SizeCore.searchScreenTopPadding(context);
      expect(searchPadding, padding * 7);

      final userImageSize = SizeCore.userImageSize(context);
      final fullWidth = SizeCore.fullWidth(context);
      expect(userImageSize, fullWidth * 0.16);

      final chatHeight = SizeCore.chatScreenHeight(context);
      final fullHeight = SizeCore.fullHeight(context);
      expect(chatHeight, fullHeight * 0.7);
    });

    testWidgets('should return positive values for valid screen sizes', (
      WidgetTester tester,
    ) async {
      const screenSize = Size(100, 200);

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(size: screenSize),
                child: Scaffold(
                  body: Builder(
                    builder: (context) {
                      return const Text('Test');
                    },
                  ),
                ),
              );
            },
          ),
        ),
      );

      final context = tester.element(find.byType(Scaffold));

      expect(SizeCore.fullHeight(context), greaterThan(0));
      expect(SizeCore.fullWidth(context), greaterThan(0));
      expect(SizeCore.userImageSize(context), greaterThan(0));
      expect(SizeCore.defaultPadding(context), greaterThan(0));
      expect(SizeCore.defaultHeaderTextSize(context), greaterThan(0));
      expect(SizeCore.defaultTabTextSize(context), greaterThan(0));
      expect(SizeCore.appBarCircular(context), greaterThan(0));
      expect(SizeCore.searchScreenTopPadding(context), greaterThan(0));
      expect(SizeCore.chatScreenHeight(context), greaterThan(0));
    });
  });
}
