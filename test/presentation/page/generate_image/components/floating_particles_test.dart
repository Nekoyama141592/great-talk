import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/presentation/page/generate_image/components/floating_particles.dart';

void main() {
  group('FloatingParticles', () {
    Widget createTestWidget({required AnimationController controller}) {
      return MaterialApp(
        home: Scaffold(
          body: FloatingParticles(animationController: controller),
        ),
      );
    }

    testWidgets('should render with AnimationController', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                final controller = AnimationController(
                  duration: const Duration(seconds: 1),
                  vsync: const TestVSync(),
                );
                return FloatingParticles(animationController: controller);
              },
            ),
          ),
        ),
      );

      expect(find.byType(FloatingParticles), findsOneWidget);
      expect(find.byType(AnimatedBuilder), findsOneWidget);
      expect(find.byType(CustomPaint), findsOneWidget);
    });

    testWidgets('should use ParticlePainter', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                final controller = AnimationController(
                  duration: const Duration(seconds: 1),
                  vsync: const TestVSync(),
                );
                return FloatingParticles(animationController: controller);
              },
            ),
          ),
        ),
      );

      final customPaint = tester.widget<CustomPaint>(find.byType(CustomPaint));
      expect(customPaint.painter, isA<ParticlePainter>());
    });

    testWidgets('should animate particles', (WidgetTester tester) async {
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
                return FloatingParticles(animationController: controller!);
              },
            ),
          ),
        ),
      );

      // Start animation
      controller!.forward();
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byType(FloatingParticles), findsOneWidget);
      
      // Complete animation
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.byType(FloatingParticles), findsOneWidget);
    });

    testWidgets('should handle screen size changes', (WidgetTester tester) async {
      final sizes = [
        const Size(360, 640),
        const Size(768, 1024),
        const Size(1024, 768),
      ];

      for (final size in sizes) {
        await tester.binding.setSurfaceSize(size);
        
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  final controller = AnimationController(
                    duration: const Duration(seconds: 1),
                    vsync: const TestVSync(),
                  );
                  return FloatingParticles(animationController: controller);
                },
              ),
            ),
          ),
        );

        expect(find.byType(FloatingParticles), findsOneWidget);
        
        final customPaint = tester.widget<CustomPaint>(find.byType(CustomPaint));
        expect(customPaint.size, size);
      }

      await tester.binding.setSurfaceSize(null);
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
                return FloatingParticles(animationController: controller);
              },
            ),
          ),
        ),
      );

      expect(find.byType(FloatingParticles), findsOneWidget);
    });

    testWidgets('should handle different animation values', (WidgetTester tester) async {
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
                return FloatingParticles(animationController: controller!);
              },
            ),
          ),
        ),
      );

      for (final value in [0.0, 0.25, 0.5, 0.75, 1.0]) {
        controller!.value = value;
        await tester.pump();
        
        expect(find.byType(FloatingParticles), findsOneWidget);
        
        final customPaint = tester.widget<CustomPaint>(find.byType(CustomPaint));
        final painter = customPaint.painter as ParticlePainter;
        expect(painter.animationValue, equals(value));
      }
    });
  });

  group('ParticlePainter', () {
    testWidgets('should create painter with animation value', (WidgetTester tester) async {
      const animationValue = 0.5;
      final painter = ParticlePainter(animationValue);
      
      expect(painter.animationValue, equals(animationValue));
    });

    testWidgets('should repaint when asked', (WidgetTester tester) async {
      final painter1 = ParticlePainter(0.0);
      final painter2 = ParticlePainter(0.5);
      
      expect(painter1.shouldRepaint(painter2), isTrue);
      expect(painter2.shouldRepaint(painter1), isTrue);
    });

    testWidgets('should handle edge animation values', (WidgetTester tester) async {
      for (final value in [0.0, 1.0, -1.0, 2.0]) {
        final painter = ParticlePainter(value);
        expect(painter.animationValue, equals(value));
      }
    });
  });
}

class TestVSync implements TickerProvider {
  const TestVSync();

  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}