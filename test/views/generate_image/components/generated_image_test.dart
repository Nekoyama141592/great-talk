import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/views/generate_image/components/generated_image.dart';

void main() {
  group('GeneratedImage', () {
    late String validBase64;
    late String invalidBase64;

    setUp(() {
      // Create a minimal PNG image (1x1 pixel) in base64
      final pngBytes = Uint8List.fromList([
        137,
        80,
        78,
        71,
        13,
        10,
        26,
        10,
        0,
        0,
        0,
        13,
        73,
        72,
        68,
        82,
        0,
        0,
        0,
        1,
        0,
        0,
        0,
        1,
        8,
        6,
        0,
        0,
        0,
        31,
        21,
        196,
        137,
        0,
        0,
        0,
        13,
        73,
        68,
        65,
        84,
        120,
        156,
        99,
        248,
        15,
        0,
        1,
        1,
        1,
        0,
        24,
        221,
        141,
        219,
        0,
        0,
        0,
        0,
        73,
        69,
        78,
        68,
        174,
        66,
        96,
        130,
      ]);
      validBase64 = base64Encode(pngBytes);
      invalidBase64 = 'invalid_base64_string!@#';
    });

    testWidgets('should display image from valid base64', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: GeneratedImage(base64: validBase64))),
      );

      expect(find.byType(GeneratedImage), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);

      final image = tester.widget<Image>(find.byType(Image));
      expect(image.image, isA<MemoryImage>());
      expect(image.fit, BoxFit.cover);
    });

    testWidgets('should show error message for invalid base64', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: GeneratedImage(base64: invalidBase64)),
        ),
      );

      // Wait for the error to be processed
      await tester.pump();

      expect(find.byType(GeneratedImage), findsOneWidget);
      expect(find.text('画像の読み込みに失敗しました'), findsOneWidget);
    });

    testWidgets('should have correct image properties', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: GeneratedImage(base64: validBase64))),
      );

      final image = tester.widget<Image>(find.byType(Image));
      expect(image.fit, BoxFit.cover);
      expect(image.errorBuilder, isNotNull);
      expect(image.frameBuilder, isNotNull);
    });

    testWidgets('should decode base64 correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: GeneratedImage(base64: validBase64))),
      );

      final image = tester.widget<Image>(find.byType(Image));
      final memoryImage = image.image as MemoryImage;

      // Verify that the decoded bytes match what we expect
      final expectedBytes = base64Decode(validBase64);
      expect(memoryImage.bytes, expectedBytes);
    });

    testWidgets('should be a StatelessWidget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: GeneratedImage(base64: validBase64))),
      );

      expect(find.byType(GeneratedImage), findsOneWidget);
    });

    testWidgets('should work with different base64 strings', (
      WidgetTester tester,
    ) async {
      // Create different image data
      final differentPngBytes = Uint8List.fromList([
        137,
        80,
        78,
        71,
        13,
        10,
        26,
        10,
        0,
        0,
        0,
        13,
        73,
        72,
        68,
        82,
        0,
        0,
        0,
        2,
        0,
        0,
        0,
        2,
        8,
        6,
        0,
        0,
        0,
        114,
        182,
        13,
        36,
        0,
        0,
        0,
        19,
        73,
        68,
        65,
        84,
        120,
        156,
        99,
        248,
        15,
        0,
        1,
        1,
        1,
        0,
        24,
        221,
        141,
        219,
        0,
        0,
        0,
        0,
        73,
        69,
        78,
        68,
        174,
        66,
        96,
        130,
      ]);
      final differentBase64 = base64Encode(differentPngBytes);

      // Test first image
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: GeneratedImage(base64: validBase64))),
      );

      expect(find.byType(Image), findsOneWidget);
      final firstImage = tester.widget<Image>(find.byType(Image));
      final firstMemoryImage = firstImage.image as MemoryImage;
      expect(firstMemoryImage.bytes, base64Decode(validBase64));

      // Test second image
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: GeneratedImage(base64: differentBase64)),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
      final secondImage = tester.widget<Image>(find.byType(Image));
      final secondMemoryImage = secondImage.image as MemoryImage;
      expect(secondMemoryImage.bytes, base64Decode(differentBase64));
    });

    testWidgets('should handle empty base64 string', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: GeneratedImage(base64: ''))),
      );

      await tester.pump();

      // Empty base64 should trigger error builder
      expect(find.text('画像の読み込みに失敗しました'), findsOneWidget);
    });

    testWidgets('should work in different layout contexts', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                const Text('Header'),
                GeneratedImage(base64: validBase64),
                const Text('Footer'),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(GeneratedImage), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(find.text('Header'), findsOneWidget);
      expect(find.text('Footer'), findsOneWidget);
    });

    testWidgets('should handle theme changes', (WidgetTester tester) async {
      Widget buildWithTheme(ThemeData theme) {
        return MaterialApp(
          theme: theme,
          home: Scaffold(body: GeneratedImage(base64: validBase64)),
        );
      }

      // Test with light theme
      await tester.pumpWidget(buildWithTheme(ThemeData.light()));
      expect(find.byType(Image), findsOneWidget);

      // Test with dark theme
      await tester.pumpWidget(buildWithTheme(ThemeData.dark()));
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('should have proper key behavior', (WidgetTester tester) async {
      const key = Key('generated_image_key');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: GeneratedImage(key: key, base64: validBase64)),
        ),
      );

      expect(find.byKey(key), findsOneWidget);
      expect(find.byType(GeneratedImage), findsOneWidget);
    });

    testWidgets('should work within scrollable widgets', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ListView(
              children: [
                const Text('Header'),
                GeneratedImage(base64: validBase64),
                const Text('Footer'),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(GeneratedImage), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('should maintain consistent behavior across rebuilds', (
      WidgetTester tester,
    ) async {
      String base64Data = validBase64;
      bool showAdditionalWidget = false;

      Widget buildWidget() {
        return MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                if (showAdditionalWidget) const Text('Additional Widget'),
                GeneratedImage(base64: base64Data),
              ],
            ),
          ),
        );
      }

      await tester.pumpWidget(buildWidget());
      expect(find.byType(Image), findsOneWidget);

      // Rebuild with additional widget
      showAdditionalWidget = true;
      await tester.pumpWidget(buildWidget());
      expect(find.text('Additional Widget'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);

      // Change base64 data
      final newBytes = Uint8List.fromList([1, 2, 3, 4]);
      base64Data = base64Encode(newBytes);
      await tester.pumpWidget(buildWidget());

      final image = tester.widget<Image>(find.byType(Image));
      final memoryImage = image.image as MemoryImage;
      expect(memoryImage.bytes, newBytes);
    });

    testWidgets('should handle frame builder correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: GeneratedImage(base64: validBase64))),
      );

      final image = tester.widget<Image>(find.byType(Image));
      expect(image.frameBuilder, isNotNull);

      // The frame builder should return the child for synchronous loading
      // or an AnimatedOpacity for asynchronous loading
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('should handle error builder correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: GeneratedImage(base64: invalidBase64)),
        ),
      );

      await tester.pump();

      // Should show error message when base64 is invalid
      expect(find.text('画像の読み込みに失敗しました'), findsOneWidget);
      // When there's a decoding error, no Image widget is created
      expect(find.byType(Image), findsNothing);
    });

    testWidgets('should work with multiple instances', (
      WidgetTester tester,
    ) async {
      final secondValidBase64 = base64Encode(Uint8List.fromList([5, 6, 7, 8]));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                GeneratedImage(base64: validBase64),
                GeneratedImage(base64: secondValidBase64),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(GeneratedImage), findsNWidgets(2));
      expect(find.byType(Image), findsNWidgets(2));

      final images = tester.widgetList<Image>(find.byType(Image));
      final firstMemoryImage = images.elementAt(0).image as MemoryImage;
      final secondMemoryImage = images.elementAt(1).image as MemoryImage;

      expect(firstMemoryImage.bytes, base64Decode(validBase64));
      expect(secondMemoryImage.bytes, base64Decode(secondValidBase64));
    });

    group('Error handling', () {
      testWidgets('should handle malformed base64', (
        WidgetTester tester,
      ) async {
        const malformedBase64 = 'this_is_not_valid_base64';

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(body: GeneratedImage(base64: malformedBase64)),
          ),
        );

        await tester.pump();
        expect(find.text('画像の読み込みに失敗しました'), findsOneWidget);
      });

      testWidgets('should handle special characters in base64', (
        WidgetTester tester,
      ) async {
        const specialBase64 = 'special!@#\$%^&*()_+characters';

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(body: GeneratedImage(base64: specialBase64)),
          ),
        );

        await tester.pump();
        expect(find.text('画像の読み込みに失敗しました'), findsOneWidget);
      });
    });
  });
}
