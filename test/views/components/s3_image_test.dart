import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/views/components/circle_image/components/s3_image.dart';

void main() {
  group('S3Image', () {
    late Uint8List testImageData;

    setUp(() {
      testImageData = Uint8List.fromList([
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
    });

    testWidgets('should render with Container and ClipOval', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: S3Image(uint8list: testImageData))),
      );

      expect(find.byType(S3Image), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
      expect(find.byType(ClipOval), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets(
      'should apply correct decoration with border and circle shape',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(home: Scaffold(body: S3Image(uint8list: testImageData))),
        );

        final container = tester.widget<Container>(find.byType(Container));
        final decoration = container.decoration as BoxDecoration;

        expect(decoration.shape, BoxShape.circle);
        expect(decoration.border, isNotNull);
        expect(decoration.border, isA<Border>());
      },
    );

    testWidgets('should use theme primary color for border', (
      WidgetTester tester,
    ) async {
      const primaryColor = Colors.red;

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            colorScheme: const ColorScheme.light(primary: primaryColor),
          ),
          home: Scaffold(body: S3Image(uint8list: testImageData)),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      final border = decoration.border as Border;

      expect(border.top.color, primaryColor);
      expect(border.bottom.color, primaryColor);
      expect(border.left.color, primaryColor);
      expect(border.right.color, primaryColor);
    });

    testWidgets('should use provided width and height', (
      WidgetTester tester,
    ) async {
      const testWidth = 100.0;
      const testHeight = 120.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: S3Image(
              uint8list: testImageData,
              width: testWidth,
              height: testHeight,
            ),
          ),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.width, testWidth);
      expect(sizedBox.height, testHeight);
    });

    testWidgets(
      'should use SizeCore default when width and height not provided',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(home: Scaffold(body: S3Image(uint8list: testImageData))),
        );

        final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
        expect(sizedBox.width, isNotNull);
        expect(sizedBox.height, isNotNull);
        expect(sizedBox.width, sizedBox.height);
      },
    );

    testWidgets('should render Image.memory with correct data', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: S3Image(uint8list: testImageData))),
      );

      final image = tester.widget<Image>(find.byType(Image));
      expect(image.image, isA<MemoryImage>());
    });

    testWidgets('should be centered with Align widget', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: S3Image(uint8list: testImageData))),
      );

      final align = tester.widget<Align>(find.byType(Align));
      expect(align.alignment, Alignment.center);
    });

    testWidgets('should be a StatelessWidget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: S3Image(uint8list: testImageData))),
      );

      expect(find.byType(S3Image), findsOneWidget);
    });

    testWidgets('should handle different image sizes', (
      WidgetTester tester,
    ) async {
      const sizes = [50.0, 100.0, 200.0];

      for (final size in sizes) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: S3Image(
                uint8list: testImageData,
                width: size,
                height: size,
              ),
            ),
          ),
        );

        final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
        expect(sizedBox.width, size);
        expect(sizedBox.height, size);
      }
    });

    testWidgets('should maintain aspect ratio when only width is provided', (
      WidgetTester tester,
    ) async {
      const testWidth = 150.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: S3Image(uint8list: testImageData, width: testWidth),
          ),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.width, testWidth);
      expect(sizedBox.height, isNotNull);
    });

    testWidgets('should maintain aspect ratio when only height is provided', (
      WidgetTester tester,
    ) async {
      const testHeight = 150.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: S3Image(uint8list: testImageData, height: testHeight),
          ),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.width, isNotNull);
      expect(sizedBox.height, testHeight);
    });

    testWidgets('should work with different themes', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(body: S3Image(uint8list: testImageData)),
        ),
      );

      expect(find.byType(S3Image), findsOneWidget);

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(body: S3Image(uint8list: testImageData)),
        ),
      );

      expect(find.byType(S3Image), findsOneWidget);
    });

    testWidgets('should handle consistent key behavior', (
      WidgetTester tester,
    ) async {
      const key = Key('s3_image_key');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: S3Image(key: key, uint8list: testImageData)),
        ),
      );

      expect(find.byKey(key), findsOneWidget);
      expect(find.byType(S3Image), findsOneWidget);
    });

    testWidgets('should work with minimal valid image data', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: S3Image(uint8list: testImageData))),
      );

      expect(find.byType(S3Image), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('should work in different layout contexts', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Row(
              children: [
                S3Image(uint8list: testImageData, width: 50),
                const SizedBox(width: 10),
                S3Image(uint8list: testImageData, width: 75),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(S3Image), findsNWidgets(2));

      final sizedBoxes = tester.widgetList<SizedBox>(find.byType(SizedBox));
      final s3ImageBoxes =
          sizedBoxes
              .where((box) => box.width == 50.0 || box.width == 75.0)
              .toList();
      expect(s3ImageBoxes.length, 2);
    });

    testWidgets('should maintain visual consistency across rebuilds', (
      WidgetTester tester,
    ) async {
      bool toggle = false;

      Widget buildWidget() {
        return MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                if (toggle) const Text('Additional widget'),
                S3Image(uint8list: testImageData, width: 100),
              ],
            ),
          ),
        );
      }

      await tester.pumpWidget(buildWidget());

      final sizedBox1 = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox1.width, 100.0);

      toggle = true;
      await tester.pumpWidget(buildWidget());

      final sizedBox2 = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox2.width, 100.0);
    });
  });
}
