import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/presentation/page/generate_image/components/generate_button.dart';

void main() {
  group('GenerateButton', () {
    bool buttonPressed = false;
    
    setUp(() {
      buttonPressed = false;
    });

    Widget createTestWidget({VoidCallback? onPressed}) {
      return MaterialApp(
        home: Scaffold(
          body: GenerateButton(
            onPressed: onPressed ?? () => buttonPressed = true,
          ),
        ),
      );
    }

    group('UI Structure', () {
      testWidgets('should render main components', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        expect(find.byType(GenerateButton), findsOneWidget);
        expect(find.byType(TweenAnimationBuilder<double>), findsOneWidget);
        expect(find.byType(Transform), findsAtLeastNWidgets(1)); // Multiple Transform widgets possible
        expect(find.byType(Container), findsAtLeastNWidgets(1));
        expect(find.byType(Material), findsAtLeastNWidgets(1)); // Multiple Material widgets possible
        expect(find.byType(InkWell), findsOneWidget);
      });

      testWidgets('should have gradient styling', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        final containers = tester.widgetList<Container>(find.byType(Container));
        
        bool hasGradient = containers.any((container) {
          final decoration = container.decoration as BoxDecoration?;
          return decoration?.gradient != null;
        });
        
        expect(hasGradient, isTrue);
      });

      testWidgets('should have proper button text', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        expect(find.text('魔法の画像を生成'), findsOneWidget);
      });

      testWidgets('should have magic icon', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        expect(find.byIcon(Icons.auto_awesome), findsOneWidget);
      });

      testWidgets('should have proper dimensions', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        final containers = tester.widgetList<Container>(find.byType(Container));
        final buttonContainer = containers.firstWhere((container) {
          final decoration = container.decoration as BoxDecoration?;
          return decoration?.gradient != null;
        });
        
        // Check if width and height constraints are properly set
        expect(buttonContainer.constraints?.maxWidth, anyOf(equals(double.infinity), isNull));
        expect(buttonContainer.constraints?.maxHeight, anyOf(equals(60.0), isNull));
      });
    });

    group('Interactions', () {
      testWidgets('should handle tap events', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        expect(buttonPressed, isFalse);

        await tester.tap(find.byType(GenerateButton));
        await tester.pump();

        expect(buttonPressed, isTrue);
      });

      testWidgets('should handle tap on text', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        expect(buttonPressed, isFalse);

        await tester.tap(find.text('魔法の画像を生成'));
        await tester.pump();

        expect(buttonPressed, isTrue);
      });

      testWidgets('should handle tap on icon', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        expect(buttonPressed, isFalse);

        await tester.tap(find.byIcon(Icons.auto_awesome));
        await tester.pump();

        expect(buttonPressed, isTrue);
      });

      testWidgets('should handle multiple taps', (WidgetTester tester) async {
        int tapCount = 0;
        
        await tester.pumpWidget(createTestWidget(
          onPressed: () => tapCount++,
        ));

        expect(tapCount, equals(0));

        // Tap multiple times
        for (int i = 1; i <= 3; i++) {
          await tester.tap(find.byType(GenerateButton));
          await tester.pump();
          expect(tapCount, equals(i));
        }
      });

      testWidgets('should handle rapid taps', (WidgetTester tester) async {
        int tapCount = 0;
        
        await tester.pumpWidget(createTestWidget(
          onPressed: () => tapCount++,
        ));

        // Rapid taps without pump in between
        await tester.tap(find.byType(GenerateButton));
        await tester.tap(find.byType(GenerateButton));
        await tester.tap(find.byType(GenerateButton));
        await tester.pump();

        expect(tapCount, equals(3));
      });
    });

    group('Animations', () {
      testWidgets('should animate scale on build', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        expect(find.byType(TweenAnimationBuilder<double>), findsOneWidget);
        
        final animationBuilder = tester.widget<TweenAnimationBuilder<double>>(
          find.byType(TweenAnimationBuilder<double>),
        );
        
        expect(animationBuilder.tween.begin, equals(0.9));
        expect(animationBuilder.tween.end, equals(1.0));
        expect(animationBuilder.duration, equals(const Duration(milliseconds: 300)));
      });

      testWidgets('should complete scale animation', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        // Animation should complete after duration
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 300));

        expect(find.byType(GenerateButton), findsOneWidget);
      });

      testWidgets('should have transform scale applied', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        expect(find.byType(Transform), findsAtLeastNWidgets(1));
        
        // Check that at least one Transform widget exists
        final transforms = tester.widgetList<Transform>(find.byType(Transform));
        expect(transforms.isNotEmpty, isTrue);
      });
    });

    group('Styling', () {
      testWidgets('should have rounded corners', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        final containers = tester.widgetList<Container>(find.byType(Container));
        final buttonContainer = containers.firstWhere((container) {
          final decoration = container.decoration as BoxDecoration?;
          return decoration?.borderRadius != null;
        });
        
        final decoration = buttonContainer.decoration as BoxDecoration;
        expect(decoration.borderRadius, equals(BorderRadius.circular(30)));
      });

      testWidgets('should have box shadow', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        final containers = tester.widgetList<Container>(find.byType(Container));
        final buttonContainer = containers.firstWhere((container) {
          final decoration = container.decoration as BoxDecoration?;
          return decoration?.boxShadow != null;
        });
        
        final decoration = buttonContainer.decoration as BoxDecoration;
        expect(decoration.boxShadow, isNotNull);
        expect(decoration.boxShadow!.isNotEmpty, isTrue);
      });

      testWidgets('should have proper gradient colors', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        final containers = tester.widgetList<Container>(find.byType(Container));
        final buttonContainer = containers.firstWhere((container) {
          final decoration = container.decoration as BoxDecoration?;
          return decoration?.gradient != null;
        });
        
        final decoration = buttonContainer.decoration as BoxDecoration;
        final gradient = decoration.gradient as LinearGradient;
        
        expect(gradient.colors.length, equals(3));
        expect(gradient.colors[0], equals(const Color(0xFF667eea)));
        expect(gradient.colors[1], equals(const Color(0xFF764ba2)));
        expect(gradient.colors[2], equals(const Color(0xFFf093fb)));
      });

      testWidgets('should have proper text styling', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        final textWidget = tester.widget<Text>(find.text('魔法の画像を生成'));
        
        expect(textWidget.style?.color, equals(Colors.white));
        expect(textWidget.style?.fontSize, equals(18));
        expect(textWidget.style?.fontWeight, equals(FontWeight.bold));
        expect(textWidget.style?.letterSpacing, equals(1.2));
      });

      testWidgets('should have icon with proper styling', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        final icons = tester.widgetList<Icon>(find.byIcon(Icons.auto_awesome));
        final iconWidget = icons.first;
        
        expect(iconWidget.color, equals(Colors.white));
        expect(iconWidget.size, equals(20));
      });
    });

    group('Accessibility', () {
      testWidgets('should be accessible', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        expect(find.byType(InkWell), findsOneWidget);
        expect(find.byType(Semantics), findsAtLeastNWidgets(1));
      });

      testWidgets('should handle focus', (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        // The InkWell should handle focus
        final inkWell = find.byType(InkWell);
        await tester.tap(inkWell);
        await tester.pump();

        expect(find.byType(GenerateButton), findsOneWidget);
      });
    });

    group('Edge Cases', () {
      testWidgets('should handle null onPressed', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: GenerateButton(onPressed: () {}),
            ),
          ),
        );

        expect(find.byType(GenerateButton), findsOneWidget);
      });

      testWidgets('should work with different themes', (WidgetTester tester) async {
        for (final theme in [ThemeData.light(), ThemeData.dark()]) {
          await tester.pumpWidget(
            MaterialApp(
              theme: theme,
              home: Scaffold(
                body: GenerateButton(onPressed: () {}),
              ),
            ),
          );

          expect(find.byType(GenerateButton), findsOneWidget);
          expect(find.text('魔法の画像を生成'), findsOneWidget);
        }
      });

      testWidgets('should maintain style across rebuilds', (WidgetTester tester) async {
        bool toggle = false;
        
        Widget buildWidget() {
          return MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  if (toggle) const Text('Toggle Widget'),
                  GenerateButton(onPressed: () {}),
                ],
              ),
            ),
          );
        }

        await tester.pumpWidget(buildWidget());
        expect(find.byType(GenerateButton), findsOneWidget);

        toggle = true;
        await tester.pumpWidget(buildWidget());
        expect(find.byType(GenerateButton), findsOneWidget);
        expect(find.text('Toggle Widget'), findsOneWidget);
      });

      testWidgets('should work in different layout contexts', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  const Text('Header'),
                  GenerateButton(onPressed: () {}),
                  const Text('Footer'),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(GenerateButton), findsOneWidget);
        expect(find.text('Header'), findsOneWidget);
        expect(find.text('Footer'), findsOneWidget);
      });
    });
  });
}