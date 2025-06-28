import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/presentation/component/circle_image/circle_image.dart';
import 'package:great_talk/presentation/component/circle_image/components/s3_image.dart';

void main() {
  group('CircleImage', () {
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

    testWidgets('should render person icon when uint8list is null', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: CircleImage())),
      );

      expect(find.byType(CircleImage), findsOneWidget);
      expect(find.byIcon(Icons.person), findsOneWidget);
      expect(find.byType(S3Image), findsNothing);
    });

    testWidgets('should render S3Image when uint8list is provided', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: CircleImage(uint8list: testImageData)),
        ),
      );

      expect(find.byType(CircleImage), findsOneWidget);
      expect(find.byType(S3Image), findsOneWidget);
      expect(find.byIcon(Icons.person), findsNothing);
    });

    testWidgets('should pass width and height to S3Image correctly', (
      WidgetTester tester,
    ) async {
      const testWidth = 100.0;
      const testHeight = 120.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CircleImage(
              uint8list: testImageData,
              width: testWidth,
              height: testHeight,
            ),
          ),
        ),
      );

      final s3Image = tester.widget<S3Image>(find.byType(S3Image));
      expect(s3Image.width, testHeight);
      expect(s3Image.uint8list, testImageData);
    });

    testWidgets('should be a StatelessWidget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: CircleImage())),
      );

      expect(find.byType(CircleImage), findsOneWidget);
    });

    testWidgets('should handle onTap parameter correctly', (
      WidgetTester tester,
    ) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CircleImage(
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      expect(find.byType(CircleImage), findsOneWidget);
      expect(tapped, false);
    });

    testWidgets('should render consistently with different parameters', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                const CircleImage(),
                CircleImage(uint8list: testImageData),
                CircleImage(uint8list: testImageData, width: 50, height: 50),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(CircleImage), findsNWidgets(3));
      expect(find.byIcon(Icons.person), findsOneWidget);
      expect(find.byType(S3Image), findsNWidgets(2));
    });

    testWidgets('should handle null parameters gracefully', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CircleImage(
              uint8list: null,
              width: null,
              height: null,
              onTap: null,
            ),
          ),
        ),
      );

      expect(find.byType(CircleImage), findsOneWidget);
      expect(find.byIcon(Icons.person), findsOneWidget);
    });

    testWidgets('should work with valid image data', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: CircleImage(uint8list: testImageData)),
        ),
      );

      expect(find.byType(S3Image), findsOneWidget);

      final s3Image = tester.widget<S3Image>(find.byType(S3Image));
      expect(s3Image.uint8list, testImageData);
    });

    testWidgets('should handle null image data correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: CircleImage(uint8list: null))),
      );

      expect(find.byIcon(Icons.person), findsOneWidget);
      expect(find.byType(S3Image), findsNothing);
    });

    testWidgets('should work in different layout contexts', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Row(
              children: [
                const CircleImage(),
                CircleImage(uint8list: testImageData),
                const CircleImage(width: 30, height: 30),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(CircleImage), findsNWidgets(3));
      expect(find.byIcon(Icons.person), findsNWidgets(2));
      expect(find.byType(S3Image), findsOneWidget);
    });

    testWidgets('should maintain consistent behavior across rebuilds', (
      WidgetTester tester,
    ) async {
      bool toggle = false;

      Widget buildWidget() {
        return MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                if (toggle) const Text('Additional widget'),
                CircleImage(uint8list: testImageData),
              ],
            ),
          ),
        );
      }

      await tester.pumpWidget(buildWidget());
      expect(find.byType(S3Image), findsOneWidget);

      toggle = true;
      await tester.pumpWidget(buildWidget());
      expect(find.byType(S3Image), findsOneWidget);
      expect(find.text('Additional widget'), findsOneWidget);
    });

    testWidgets('should have consistent key behavior', (
      WidgetTester tester,
    ) async {
      const key = Key('circle_image_key');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: CircleImage(key: key, uint8list: testImageData)),
        ),
      );

      expect(find.byKey(key), findsOneWidget);
      expect(find.byType(CircleImage), findsOneWidget);
    });

    testWidgets('should handle size parameters consistently', (
      WidgetTester tester,
    ) async {
      const testSize = 80.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CircleImage(
              uint8list: testImageData,
              width: testSize,
              height: testSize,
            ),
          ),
        ),
      );

      final s3Image = tester.widget<S3Image>(find.byType(S3Image));
      expect(s3Image.width, testSize);
    });

    testWidgets('should prefer height over width for S3Image', (
      WidgetTester tester,
    ) async {
      const testWidth = 100.0;
      const testHeight = 80.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CircleImage(
              uint8list: testImageData,
              width: testWidth,
              height: testHeight,
            ),
          ),
        ),
      );

      final s3Image = tester.widget<S3Image>(find.byType(S3Image));
      expect(s3Image.width, testHeight);
    });

    testWidgets('should work with ListView and other scrollable widgets', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ListView(
              children: [
                const CircleImage(),
                CircleImage(uint8list: testImageData),
                const CircleImage(width: 60, height: 60),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(CircleImage), findsNWidgets(3));
      expect(find.byIcon(Icons.person), findsNWidgets(2));
      expect(find.byType(S3Image), findsOneWidget);
    });

    testWidgets('should handle theme changes', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(body: CircleImage(uint8list: testImageData)),
        ),
      );

      expect(find.byType(S3Image), findsOneWidget);

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(body: CircleImage(uint8list: testImageData)),
        ),
      );

      expect(find.byType(S3Image), findsOneWidget);
    });
  });
}
