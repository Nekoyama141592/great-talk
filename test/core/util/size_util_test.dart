import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/core/util/size_util.dart';

void main() {
  group('SizeUtil', () {
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
                          Text('Full Height: ${SizeUtil.fullHeight(context)}'),
                          Text('Full Width: ${SizeUtil.fullWidth(context)}'),
                          Text(
                            'User Image Size: ${SizeUtil.userImageSize(context)}',
                          ),
                          Text(
                            'Default Padding: ${SizeUtil.defaultPadding(context)}',
                          ),
                          Text(
                            'Header Text Size: ${SizeUtil.defaultHeaderTextSize(context)}',
                          ),
                          Text(
                            'Tab Text Size: ${SizeUtil.defaultTabTextSize(context)}',
                          ),
                          Text(
                            'App Bar Circular: ${SizeUtil.appBarCircular(context)}',
                          ),
                          Text(
                            'Search Top Padding: ${SizeUtil.searchScreenTopPadding(context)}',
                          ),
                          Text(
                            'Chat Screen Height: ${SizeUtil.chatScreenHeight(context)}',
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

      expect(SizeUtil.fullHeight(context), 800.0);
      expect(SizeUtil.fullWidth(context), 400.0);
      expect(SizeUtil.userImageSize(context), 400.0 * 0.16); // 64.0
      expect(SizeUtil.defaultPadding(context), 800.0 / 100.0); // 8.0
      expect(SizeUtil.defaultHeaderTextSize(context), 800.0 / 32.0); // 25.0
      expect(SizeUtil.defaultTabTextSize(context), 800.0 / 50.0); // 16.0
      expect(SizeUtil.appBarCircular(context), 800.0 / 25.0); // 32.0
      expect(
        SizeUtil.searchScreenTopPadding(context),
        (800.0 / 100.0) * 7,
      ); // 56.0
      expect(SizeUtil.chatScreenHeight(context), 800.0 * 0.7); // 560.0
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

      expect(SizeUtil.fullHeight(context), 600.0);
      expect(SizeUtil.fullWidth(context), 300.0);
      expect(SizeUtil.userImageSize(context), 300.0 * 0.16); // 48.0
      expect(SizeUtil.defaultPadding(context), 600.0 / 100.0); // 6.0
      expect(SizeUtil.chatScreenHeight(context), 600.0 * 0.7); // 420.0
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

      expect(SizeUtil.fullHeight(context), 1200.0);
      expect(SizeUtil.fullWidth(context), 800.0);
      expect(SizeUtil.userImageSize(context), 800.0 * 0.16); // 128.0
      expect(SizeUtil.defaultPadding(context), 1200.0 / 100.0); // 12.0
      expect(SizeUtil.chatScreenHeight(context), 1200.0 * 0.7); // 840.0
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
      final padding = SizeUtil.defaultPadding(context);
      final searchPadding = SizeUtil.searchScreenTopPadding(context);
      expect(searchPadding, padding * 7);

      final userImageSize = SizeUtil.userImageSize(context);
      final fullWidth = SizeUtil.fullWidth(context);
      expect(userImageSize, fullWidth * 0.16);

      final chatHeight = SizeUtil.chatScreenHeight(context);
      final fullHeight = SizeUtil.fullHeight(context);
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

      expect(SizeUtil.fullHeight(context), greaterThan(0));
      expect(SizeUtil.fullWidth(context), greaterThan(0));
      expect(SizeUtil.userImageSize(context), greaterThan(0));
      expect(SizeUtil.defaultPadding(context), greaterThan(0));
      expect(SizeUtil.defaultHeaderTextSize(context), greaterThan(0));
      expect(SizeUtil.defaultTabTextSize(context), greaterThan(0));
      expect(SizeUtil.appBarCircular(context), greaterThan(0));
      expect(SizeUtil.searchScreenTopPadding(context), greaterThan(0));
      expect(SizeUtil.chatScreenHeight(context), greaterThan(0));
    });
  });
}
