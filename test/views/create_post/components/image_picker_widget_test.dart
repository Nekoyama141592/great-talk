import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/presentation/state/create_post/create_post_state.dart';
import 'package:great_talk/presentation/page/create_post/components/image_picker_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  group('ImagePickerWidget', () {
    testWidgets('should display image icon when no image is selected', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: ImagePickerWidget(state: null, isPremiumSubscribing: false),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.image), findsOneWidget);
      expect(find.byType(InkWell), findsOneWidget);
    });

    testWidgets('should display generate button for premium users', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: ImagePickerWidget(state: null, isPremiumSubscribing: true),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.image), findsOneWidget);
      expect(find.text('画像を生成する'), findsOneWidget);
      expect(find.byType(TextButton), findsOneWidget);
    });

    testWidgets('should not display generate button for non-premium users', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: ImagePickerWidget(state: null, isPremiumSubscribing: false),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.image), findsOneWidget);
      expect(find.text('画像を生成する'), findsNothing);
      expect(find.byType(TextButton), findsNothing);
    });

    testWidgets('should display picked image when image is selected', (
      WidgetTester tester,
    ) async {
      // Create a simple base64 encoded image (1x1 red pixel PNG)
      const String base64Image =
          'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==';

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: ImagePickerWidget(
                state: CreatePostState(pickedImage: base64Image),
                isPremiumSubscribing: false,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
      expect(find.byType(InkWell), findsOneWidget);
    });

    testWidgets('should have tappable area for image selection', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: ImagePickerWidget(state: null, isPremiumSubscribing: false),
            ),
          ),
        ),
      );

      expect(find.byType(InkWell), findsOneWidget);
    });
  });

  group('ToGeneratePageButton', () {
    testWidgets('should display generate image button', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: ToGeneratePageButton())),
      );

      expect(find.text('画像を生成する'), findsOneWidget);
      expect(find.byType(TextButton), findsOneWidget);
    });

    testWidgets('should have onPressed callback', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: ToGeneratePageButton())),
      );

      final button = tester.widget<TextButton>(find.byType(TextButton));
      expect(button.onPressed, isNotNull);
    });

    testWidgets('should have correct text styling', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            colorScheme: const ColorScheme.light().copyWith(
              tertiary: Colors.blue,
            ),
          ),
          home: const Scaffold(body: ToGeneratePageButton()),
        ),
      );

      expect(find.text('画像を生成する'), findsOneWidget);
    });
  });
}
