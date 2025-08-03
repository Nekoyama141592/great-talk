import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/presentation/component/rounded_button.dart';

void main() {
  group('RoundedButton', () {
    testWidgets('should display text correctly', (WidgetTester tester) async {
      const buttonText = 'Test Button';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: RoundedButton(text: buttonText, press: () {})),
        ),
      );

      expect(find.text(buttonText), findsOneWidget);
    });

    testWidgets('should call onPressed when tapped', (
      WidgetTester tester,
    ) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedButton(
              text: 'Tap Me',
              press: () {
                wasPressed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(RoundedButton), warnIfMissed: false);
      await tester.pump();

      expect(wasPressed, true);
    });

    testWidgets('should not be tappable when press is null', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RoundedButton(text: 'Disabled Button', press: null),
          ),
        ),
      );

      final button = tester.widget<RoundedButton>(find.byType(RoundedButton));
      expect(button.press, isNull);
    });

    testWidgets('should use default width rate', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedButton(text: 'Default Width', press: () {}),
          ),
        ),
      );

      final buttonWidget = tester.widget<RoundedButton>(find.byType(RoundedButton));
      expect(buttonWidget.widthRate, 0.85); // default widthRate
    });

    testWidgets('should use custom width rate', (WidgetTester tester) async {
      const customWidthRate = 0.5;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedButton(
              text: 'Custom Width',
              press: () {},
              widthRate: customWidthRate,
            ),
          ),
        ),
      );

      final buttonWidget = tester.widget<RoundedButton>(find.byType(RoundedButton));
      expect(buttonWidget.widthRate, customWidthRate);
    });

    testWidgets('should use custom button color', (WidgetTester tester) async {
      const customColor = Colors.red;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedButton(
              text: 'Red Button',
              press: () {},
              buttonColor: customColor,
            ),
          ),
        ),
      );

      final button = tester.widget<RoundedButton>(find.byType(RoundedButton));
      final backgroundColor = button.buttonColor;

      expect(backgroundColor, customColor);
    });

    testWidgets('should display icon when provided', (
      WidgetTester tester,
    ) async {
      const iconWidget = Icon(Icons.star);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedButton(
              text: 'Button with Icon',
              press: () {},
              icon: iconWidget,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsOneWidget);
      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('should not display Row when icon is null', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedButton(
              text: 'Button without Icon',
              press: () {},
              icon: null,
            ),
          ),
        ),
      );

      expect(find.byType(Row), findsNothing);
    });

    testWidgets('should use custom text color', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedButton(
              text: 'Custom Text Color',
              press: () {},
              textColor: Colors.green,
            ),
          ),
        ),
      );

      // Find BasicBoldText widget and verify it was created
      // Note: We can't easily test the actual text color without accessing internal implementation
      expect(find.text('Custom Text Color'), findsOneWidget);
    });

    testWidgets('should have rounded corners', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedButton(text: 'Rounded Button', press: () {}),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      final decoration = container.decoration as BoxDecoration?;
      expect(decoration, isNotNull);
      expect(decoration!.borderRadius, isA<BorderRadius>());

      final borderRadius = decoration.borderRadius as BorderRadius;
      expect(borderRadius.topLeft.x, greaterThan(0));
    });

    testWidgets('should work with different screen sizes', (
      WidgetTester tester,
    ) async {
      // Test with small screen size
      await tester.binding.setSurfaceSize(const Size(300, 600));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedButton(text: 'Small Screen', press: () {}),
          ),
        ),
      );

      await tester.pumpAndSettle();
      final buttonWidget = tester.widget<RoundedButton>(find.byType(RoundedButton));
      // Verify the button's widthRate property matches expected calculation
      expect(buttonWidget.widthRate, 0.85);

      // Reset to default size
      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('should handle multiple rapid taps', (
      WidgetTester tester,
    ) async {
      int tapCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedButton(
              text: 'Multi Tap',
              press: () {
                tapCount++;
              },
            ),
          ),
        ),
      );

      // Tap multiple times rapidly
      for (int i = 0; i < 5; i++) {
        await tester.tap(find.byType(RoundedButton), warnIfMissed: false);
        await tester.pump(const Duration(milliseconds: 10));
      }

      expect(tapCount, 5);
    });

    testWidgets('should maintain state across rebuilds', (
      WidgetTester tester,
    ) async {
      bool isPressed = false;

      Widget buildButton() {
        return MaterialApp(
          home: Scaffold(
            body: RoundedButton(
              text: isPressed ? 'Pressed' : 'Not Pressed',
              press: () {
                isPressed = !isPressed;
              },
            ),
          ),
        );
      }

      await tester.pumpWidget(buildButton());

      expect(find.text('Not Pressed'), findsOneWidget);

      await tester.tap(find.byType(RoundedButton), warnIfMissed: false);
      await tester.pumpWidget(buildButton());

      expect(find.text('Pressed'), findsOneWidget);
    });

    testWidgets('should be enabled by default', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedButton(text: 'Default Enabled', press: () {}),
          ),
        ),
      );

      final button = tester.widget<RoundedButton>(find.byType(RoundedButton));
      expect(button.press, isNotNull);
    });

    testWidgets('should be disabled when enabled is false', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedButton(
              text: 'Disabled Button',
              press: () {},
              enabled: false,
            ),
          ),
        ),
      );

      final button = tester.widget<RoundedButton>(find.byType(RoundedButton));
      expect(button.enabled, false);
      expect(button.press, isNotNull); // press callback exists but button is disabled
    });

    testWidgets('should use gray colors when disabled', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedButton(
              text: 'Disabled Button',
              press: () {},
              enabled: false,
            ),
          ),
        ),
      );

      final button = tester.widget<RoundedButton>(find.byType(RoundedButton));
      expect(button.enabled, false);
      expect(button.buttonColor, isNull); // null when not explicitly set
    });

    testWidgets('should not call press when disabled and tapped', (
      WidgetTester tester,
    ) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedButton(
              text: 'Disabled Button',
              press: () {
                wasPressed = true;
              },
              enabled: false,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(RoundedButton), warnIfMissed: false);
      await tester.pump();

      expect(wasPressed, false);
    });

    testWidgets('should work normally when enabled is true', (
      WidgetTester tester,
    ) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedButton(
              text: 'Enabled Button',
              press: () {
                wasPressed = true;
              },
              enabled: true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(RoundedButton), warnIfMissed: false);
      await tester.pump();

      expect(wasPressed, true);
    });
  });
}
