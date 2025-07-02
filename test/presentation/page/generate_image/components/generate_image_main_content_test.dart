import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/core/constant/generate_image_constants.dart';
import 'package:great_talk/presentation/page/generate_image/components/generate_image_main_content.dart';
import 'package:great_talk/presentation/page/generate_image/components/glassmorphic_image_container.dart';
import 'package:great_talk/presentation/page/generate_image/components/modern_prompt_input.dart';
import 'package:great_talk/presentation/page/generate_image/components/size_selector.dart';
import 'package:great_talk/presentation/page/generate_image/components/generate_button.dart';

void main() {
  group('GenerateImageMainContent', () {
    late TextEditingController promptController;
    String selectedSize = GenerateImageEnum.sqare.text();
    String? promptChanged;
    String? sizeChanged;
    bool generatePressed = false;

    setUp(() {
      promptController = TextEditingController();
      selectedSize = GenerateImageEnum.sqare.text();
      promptChanged = null;
      sizeChanged = null;
      generatePressed = false;
    });

    tearDown(() {
      promptController.dispose();
    });

    Widget createTestWidget({String? base64, String? selectedSizeOverride}) {
      return MaterialApp(
        home: Scaffold(
          body: GenerateImageMainContent(
            base64: base64,
            promptController: promptController,
            selectedSize: selectedSizeOverride ?? selectedSize,
            onPromptChanged: (text) => promptChanged = text,
            onSizeChanged: (size) => sizeChanged = size,
            onGenerate: () async => generatePressed = true,
          ),
        ),
      );
    }

    group('UI Structure', () {
      testWidgets('should render main components without image', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(createTestWidget());

        expect(find.byType(GenerateImageMainContent), findsOneWidget);
        expect(find.byType(Column), findsOneWidget);
        expect(find.byType(ModernPromptInput), findsOneWidget);
        expect(find.byType(GenerateButton), findsOneWidget);
        expect(find.byType(GlassmorphicImageContainer), findsNothing);
      });

      testWidgets('should render main components with image', (
        WidgetTester tester,
      ) async {
        const base64 =
            'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==';

        await tester.pumpWidget(createTestWidget(base64: base64));

        expect(find.byType(GenerateImageMainContent), findsOneWidget);
        expect(find.byType(GlassmorphicImageContainer), findsOneWidget);
        expect(find.byType(ModernPromptInput), findsOneWidget);
        expect(find.byType(GenerateButton), findsOneWidget);
      });

      testWidgets('should have proper spacing between components', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(createTestWidget());

        final sizedBoxes = tester.widgetList<SizedBox>(find.byType(SizedBox));

        // Check for various spacing sizes
        expect(
          sizedBoxes.any((box) => box.height == 24),
          isTrue,
        ); // Between prompt and size selector
        expect(
          sizedBoxes.any((box) => box.height == 32),
          isTrue,
        ); // Between size selector and button, and after button
      });

      testWidgets('should have proper spacing with image', (
        WidgetTester tester,
      ) async {
        const base64 =
            'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==';

        await tester.pumpWidget(createTestWidget(base64: base64));

        final sizedBoxes = tester.widgetList<SizedBox>(find.byType(SizedBox));

        // Should have additional spacing after image
        expect(sizedBoxes.any((box) => box.height == 32), isTrue);
      });
    });

    group('Prompt Input Interactions', () {
      testWidgets('should trigger onPromptChanged callback', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(createTestWidget());

        final promptInput = find.byType(ModernPromptInput);
        expect(promptInput, findsOneWidget);

        // Get the ModernPromptInput widget and trigger its onChanged callback
        final modernPromptInputWidget = tester.widget<ModernPromptInput>(
          promptInput,
        );
        modernPromptInputWidget.onChanged('Test prompt');

        expect(promptChanged, equals('Test prompt'));
      });

      testWidgets('should handle null prompt text', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(createTestWidget());

        final promptInput = find.byType(ModernPromptInput);
        final modernPromptInputWidget = tester.widget<ModernPromptInput>(
          promptInput,
        );
        modernPromptInputWidget.onChanged(null);

        expect(promptChanged, isNull);
      });

      testWidgets('should pass correct controller to prompt input', (
        WidgetTester tester,
      ) async {
        promptController.text = 'Initial text';

        await tester.pumpWidget(createTestWidget());

        final promptInput = find.byType(ModernPromptInput);
        final modernPromptInputWidget = tester.widget<ModernPromptInput>(
          promptInput,
        );

        expect(modernPromptInputWidget.controller, equals(promptController));
        expect(modernPromptInputWidget.controller.text, equals('Initial text'));
      });
    });

    group('Size Selector Interactions', () {
      testWidgets('should display size selector wrapper', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(createTestWidget());

        // The _SizeSelectorWrapper should contain a SizeSelector
        expect(find.byType(SizeSelector), findsOneWidget);
      });

      testWidgets('should pass correct selected size', (
        WidgetTester tester,
      ) async {
        const testSize = '1024x1024';

        await tester.pumpWidget(
          createTestWidget(selectedSizeOverride: testSize),
        );

        // The size should be passed to the internal wrapper
        expect(find.byType(SizeSelector), findsOneWidget);
      });

      testWidgets('should handle size changes through dropdown', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(createTestWidget());
        await tester.pumpAndSettle();

        // Find the dropdown button
        final dropdown = find.byType(DropdownButton<String>);
        expect(dropdown, findsOneWidget);

        // Tap the dropdown to open it
        await tester.tap(dropdown, warnIfMissed: false);
        await tester.pumpAndSettle();

        // Find and tap a different size option
        final horizontalOption =
            find.text(GenerateImageEnum.horizontal.text()).last;
        await tester.tap(horizontalOption, warnIfMissed: false);
        await tester.pumpAndSettle();

        // Verify the callback was triggered
        expect(sizeChanged, equals(GenerateImageEnum.horizontal.text()));
      });
    });

    group('Generate Button Interactions', () {
      testWidgets('should trigger onGenerate callback when pressed', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(createTestWidget());

        expect(generatePressed, isFalse);

        await tester.tap(find.byType(GenerateButton), warnIfMissed: false);
        await tester.pump();

        expect(generatePressed, isTrue);
      });

      testWidgets('should handle multiple generate button presses', (
        WidgetTester tester,
      ) async {
        int generateCount = 0;

        Widget testWidget = MaterialApp(
          home: Scaffold(
            body: GenerateImageMainContent(
              base64: null,
              promptController: promptController,
              selectedSize: selectedSize,
              onPromptChanged: (text) => promptChanged = text,
              onSizeChanged: (size) => sizeChanged = size,
              onGenerate: () async => generateCount++,
            ),
          ),
        );

        await tester.pumpWidget(testWidget);

        expect(generateCount, equals(0));

        // Press multiple times
        for (int i = 1; i <= 3; i++) {
          await tester.tap(find.byType(GenerateButton), warnIfMissed: false);
          await tester.pump();
          expect(generateCount, equals(i));
        }
      });
    });

    group('Image Display', () {
      testWidgets('should not show image container when base64 is null', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(createTestWidget(base64: null));

        expect(find.byType(GlassmorphicImageContainer), findsNothing);
      });

      testWidgets('should show image container when base64 is provided', (
        WidgetTester tester,
      ) async {
        const base64 =
            'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==';

        await tester.pumpWidget(createTestWidget(base64: base64));

        expect(find.byType(GlassmorphicImageContainer), findsOneWidget);

        final imageContainer = tester.widget<GlassmorphicImageContainer>(
          find.byType(GlassmorphicImageContainer),
        );
        expect(imageContainer.base64, equals(base64));
      });

      testWidgets('should show image container with empty base64', (
        WidgetTester tester,
      ) async {
        const base64 = '';

        await tester.pumpWidget(createTestWidget(base64: base64));

        expect(find.byType(GlassmorphicImageContainer), findsOneWidget);
      });
    });

    group('Layout and Responsiveness', () {
      testWidgets('should work in different screen sizes', (
        WidgetTester tester,
      ) async {
        // Test with different screen sizes
        final sizes = [
          const Size(400, 800), // Mobile
          const Size(800, 600), // Tablet landscape
          const Size(1200, 800), // Desktop
        ];

        for (final size in sizes) {
          await tester.binding.setSurfaceSize(size);
          await tester.pumpWidget(createTestWidget());

          expect(find.byType(GenerateImageMainContent), findsOneWidget);
          expect(find.byType(ModernPromptInput), findsOneWidget);
          expect(find.byType(GenerateButton), findsOneWidget);
        }

        // Reset to default size
        await tester.binding.setSurfaceSize(null);
      });

      testWidgets('should maintain component order', (
        WidgetTester tester,
      ) async {
        const base64 =
            'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==';

        await tester.pumpWidget(createTestWidget(base64: base64));

        final column = tester.widget<Column>(find.byType(Column));
        final children = column.children;

        // Expected order: [Image, SizedBox, PromptInput, SizedBox, SizeSelector, SizedBox, GenerateButton, SizedBox]
        expect(children.length, equals(8));
        expect(children[2], isA<ModernPromptInput>());
        expect(children[4], isA<Widget>()); // SizeSelector wrapper
        expect(children[6], isA<GenerateButton>());
      });
    });

    group('State Management', () {
      testWidgets('should update when selectedSize changes', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          createTestWidget(
            selectedSizeOverride: GenerateImageEnum.sqare.text(),
          ),
        );

        expect(find.byType(SizeSelector), findsOneWidget);

        // Rebuild with different size
        await tester.pumpWidget(
          createTestWidget(
            selectedSizeOverride: GenerateImageEnum.horizontal.text(),
          ),
        );

        expect(find.byType(SizeSelector), findsOneWidget);
      });

      testWidgets('should update when base64 changes', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(createTestWidget(base64: null));

        expect(find.byType(GlassmorphicImageContainer), findsNothing);

        // Add image
        const base64 =
            'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==';
        await tester.pumpWidget(createTestWidget(base64: base64));

        expect(find.byType(GlassmorphicImageContainer), findsOneWidget);

        // Remove image
        await tester.pumpWidget(createTestWidget(base64: null));

        expect(find.byType(GlassmorphicImageContainer), findsNothing);
      });
    });

    group('Edge Cases', () {
      testWidgets('should handle very long prompt text', (
        WidgetTester tester,
      ) async {
        final longText = 'A' * 1000;
        promptController.text = longText;

        await tester.pumpWidget(createTestWidget());

        expect(find.byType(ModernPromptInput), findsOneWidget);
        final promptInput = tester.widget<ModernPromptInput>(
          find.byType(ModernPromptInput),
        );
        expect(promptInput.controller.text, equals(longText));
      });

      testWidgets('should handle all available size options', (
        WidgetTester tester,
      ) async {
        for (final sizeEnum in GenerateImageEnum.values) {
          await tester.pumpWidget(
            createTestWidget(selectedSizeOverride: sizeEnum.text()),
          );

          expect(find.byType(SizeSelector), findsOneWidget);
          await tester.pump();
        }
      });

      testWidgets('should handle rapid interactions', (
        WidgetTester tester,
      ) async {
        int interactionCount = 0;

        Widget testWidget = MaterialApp(
          home: Scaffold(
            body: GenerateImageMainContent(
              base64: null,
              promptController: promptController,
              selectedSize: selectedSize,
              onPromptChanged: (text) => interactionCount++,
              onSizeChanged: (size) => interactionCount++,
              onGenerate: () async => interactionCount++,
            ),
          ),
        );

        await tester.pumpWidget(testWidget);

        // Rapid prompt changes
        final promptInput = tester.widget<ModernPromptInput>(
          find.byType(ModernPromptInput),
        );
        promptInput.onChanged('Text 1');
        promptInput.onChanged('Text 2');
        promptInput.onChanged('Text 3');

        expect(interactionCount, equals(3));
      });

      testWidgets('should work with different themes', (
        WidgetTester tester,
      ) async {
        for (final theme in [ThemeData.light(), ThemeData.dark()]) {
          await tester.pumpWidget(
            MaterialApp(
              theme: theme,
              home: Scaffold(
                body: GenerateImageMainContent(
                  base64: null,
                  promptController: promptController,
                  selectedSize: selectedSize,
                  onPromptChanged: (text) => promptChanged = text,
                  onSizeChanged: (size) => sizeChanged = size,
                  onGenerate: () async => generatePressed = true,
                ),
              ),
            ),
          );

          expect(find.byType(GenerateImageMainContent), findsOneWidget);
          expect(find.byType(ModernPromptInput), findsOneWidget);
          expect(find.byType(GenerateButton), findsOneWidget);
        }
      });
    });

    group('Integration', () {
      testWidgets('should work as part of larger widget tree', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              appBar: AppBar(title: const Text('Test')),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GenerateImageMainContent(
                    base64: null,
                    promptController: promptController,
                    selectedSize: selectedSize,
                    onPromptChanged: (text) => promptChanged = text,
                    onSizeChanged: (size) => sizeChanged = size,
                    onGenerate: () async => generatePressed = true,
                  ),
                ),
              ),
            ),
          ),
        );

        expect(find.byType(GenerateImageMainContent), findsOneWidget);
        expect(find.text('Test'), findsOneWidget);
        expect(find.byType(SingleChildScrollView), findsOneWidget);
      });

      testWidgets('should handle scroll behavior correctly', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(height: 500, color: Colors.red),
                    GenerateImageMainContent(
                      base64: null,
                      promptController: promptController,
                      selectedSize: selectedSize,
                      onPromptChanged: (text) => promptChanged = text,
                      onSizeChanged: (size) => sizeChanged = size,
                      onGenerate: () async => generatePressed = true,
                    ),
                    Container(height: 500, color: Colors.blue),
                  ],
                ),
              ),
            ),
          ),
        );

        expect(find.byType(GenerateImageMainContent), findsOneWidget);

        // Scroll to make sure the component is visible
        await tester.drag(
          find.byType(SingleChildScrollView),
          const Offset(0, -300),
        );
        await tester.pumpAndSettle();

        expect(find.byType(GenerateButton), findsOneWidget);
      });
    });
  });
}
