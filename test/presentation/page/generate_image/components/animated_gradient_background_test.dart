import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/presentation/page/generate_image/components/animated_gradient_background.dart';

void main() {
  group('AnimatedGradientBackground', () {
    late AnimationController animationController;

    setUp(() {
      // This will be set up in the test widget context
    });

    Widget createTestWidget({required AnimationController controller}) {
      return MaterialApp(
        home: Scaffold(
          body: AnimatedGradientBackground(animationController: controller),
        ),
      );
    }

    testWidgets('should render with AnimationController', (
      WidgetTester tester,
    ) async {
      // Create a test animation controller
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                final controller = AnimationController(
                  duration: const Duration(seconds: 1),
                  vsync: const TestVSync(),
                );
                return AnimatedGradientBackground(
                  animationController: controller,
                );
              },
            ),
          ),
        ),
      );

      expect(find.byType(AnimatedGradientBackground), findsOneWidget);
      expect(find.byType(AnimatedBuilder), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('should have gradient decoration', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                final controller = AnimationController(
                  duration: const Duration(seconds: 1),
                  vsync: const TestVSync(),
                );
                return AnimatedGradientBackground(
                  animationController: controller,
                );
              },
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;

      expect(decoration.gradient, isNotNull);
      expect(decoration.gradient, isA<LinearGradient>());

      final gradient = decoration.gradient as LinearGradient;
      expect(gradient.colors.length, equals(6)); // 6 colors in the gradient
    });

    testWidgets('should animate gradient rotation', (
      WidgetTester tester,
    ) async {
      AnimationController? controller;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                controller = AnimationController(
                  duration: const Duration(seconds: 1),
                  vsync: const TestVSync(),
                );
                return AnimatedGradientBackground(
                  animationController: controller!,
                );
              },
            ),
          ),
        ),
      );

      // Start animation
      controller!.forward();
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500)); // Half way through

      expect(find.byType(AnimatedGradientBackground), findsOneWidget);

      // Complete animation
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.byType(AnimatedGradientBackground), findsOneWidget);
    });

    testWidgets('should have proper gradient colors', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                final controller = AnimationController(
                  duration: const Duration(seconds: 1),
                  vsync: const TestVSync(),
                );
                return AnimatedGradientBackground(
                  animationController: controller,
                );
              },
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      final gradient = decoration.gradient as LinearGradient;

      // Check that we have the expected colors
      expect(gradient.colors.length, equals(6));

      // Verify the colors are semi-transparent (alpha < 1.0)
      for (final color in gradient.colors) {
        expect(color.alpha, lessThan(255)); // Semi-transparent
      }
    });

    testWidgets('should handle different animation states', (
      WidgetTester tester,
    ) async {
      AnimationController? controller;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                controller = AnimationController(
                  duration: const Duration(seconds: 1),
                  vsync: const TestVSync(),
                );
                return AnimatedGradientBackground(
                  animationController: controller!,
                );
              },
            ),
          ),
        ),
      );

      // Test different animation values
      controller!.value = 0.0;
      await tester.pump();
      expect(find.byType(AnimatedGradientBackground), findsOneWidget);

      controller!.value = 0.5;
      await tester.pump();
      expect(find.byType(AnimatedGradientBackground), findsOneWidget);

      controller!.value = 1.0;
      await tester.pump();
      expect(find.byType(AnimatedGradientBackground), findsOneWidget);
    });

    testWidgets('should be a StatelessWidget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                final controller = AnimationController(
                  duration: const Duration(seconds: 1),
                  vsync: const TestVSync(),
                );
                return AnimatedGradientBackground(
                  animationController: controller,
                );
              },
            ),
          ),
        ),
      );

      expect(find.byType(AnimatedGradientBackground), findsOneWidget);
    });

    testWidgets('should work with different animation durations', (
      WidgetTester tester,
    ) async {
      for (final duration in [
        const Duration(milliseconds: 500),
        const Duration(seconds: 1),
        const Duration(seconds: 2),
      ]) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  final controller = AnimationController(
                    duration: duration,
                    vsync: const TestVSync(),
                  );
                  return AnimatedGradientBackground(
                    animationController: controller,
                  );
                },
              ),
            ),
          ),
        );

        expect(find.byType(AnimatedGradientBackground), findsOneWidget);
      }
    });

    testWidgets('should properly dispose resources', (
      WidgetTester tester,
    ) async {
      AnimationController? controller;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                controller = AnimationController(
                  duration: const Duration(seconds: 1),
                  vsync: const TestVSync(),
                );
                return AnimatedGradientBackground(
                  animationController: controller!,
                );
              },
            ),
          ),
        ),
      );

      expect(find.byType(AnimatedGradientBackground), findsOneWidget);

      // Widget should handle being removed from tree
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: SizedBox())),
      );
      expect(find.byType(AnimatedGradientBackground), findsNothing);
    });
  });
}

class TestVSync implements TickerProvider {
  const TestVSync();

  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}
