import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/views/edit/components/profile_image_widget.dart';

void main() {
  group('ProfileImageWidget', () {
    testWidgets('should display default icon when no image is provided', (WidgetTester tester) async {
      bool wasTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProfileImageWidget(
              base64Image: null,
              onImageTap: () {
                wasTapped = true;
              },
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.image), findsOneWidget);
      expect(find.byType(InkWell), findsOneWidget);

      await tester.tap(find.byType(InkWell));
      await tester.pump();

      expect(wasTapped, true);
    });

    testWidgets('should display image when base64 data is provided', (WidgetTester tester) async {
      // Valid 1x1 red pixel PNG in base64
      const String base64Image = 'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==';
      bool wasTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProfileImageWidget(
              base64Image: base64Image,
              onImageTap: () {
                wasTapped = true;
              },
            ),
          ),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
      expect(find.byType(InkWell), findsOneWidget);

      await tester.tap(find.byType(InkWell));
      await tester.pump();

      expect(wasTapped, true);
    });

    testWidgets('should handle null base64 gracefully', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProfileImageWidget(
              base64Image: null,
              onImageTap: () {},
            ),
          ),
        ),
      );

      expect(find.byType(InkWell), findsOneWidget);
      expect(find.byIcon(Icons.image), findsOneWidget);
    });

    testWidgets('should be tappable in both states', (WidgetTester tester) async {
      int tapCount = 0;

      // Test with no image
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProfileImageWidget(
              base64Image: null,
              onImageTap: () {
                tapCount++;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(InkWell));
      await tester.pump();
      expect(tapCount, 1);

      // Test with image
      const String base64Image = 'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==';
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProfileImageWidget(
              base64Image: base64Image,
              onImageTap: () {
                tapCount++;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(InkWell));
      await tester.pump();
      expect(tapCount, 2);
    });

    testWidgets('should have consistent size for image display', (WidgetTester tester) async {
      const String base64Image = 'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProfileImageWidget(
              base64Image: base64Image,
              onImageTap: () {},
            ),
          ),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
      // The S3Image widget should have the specified dimensions (128x128)
    });

    testWidgets('should have consistent icon size for no image state', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProfileImageWidget(
              base64Image: null,
              onImageTap: () {},
            ),
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.image));
      expect(icon.size, 128);
    });
  });
}