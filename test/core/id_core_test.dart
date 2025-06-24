import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/core/id_core.dart';

void main() {
  group('IdCore', () {
    group('randomString', () {
      test('should generate a non-empty string', () {
        final result = IdCore.randomString();

        expect(result, isA<String>());
        expect(result.isNotEmpty, true);
      });

      test('should generate a valid UUID v4 format', () {
        final result = IdCore.randomString();

        // UUID v4 format: xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx
        final uuidPattern = RegExp(
          r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
          caseSensitive: false,
        );

        expect(result, matches(uuidPattern));
        expect(result.length, 36); // Standard UUID length
      });

      test('should generate unique strings on multiple calls', () {
        final results = <String>{};

        // Generate multiple UUIDs and ensure they're unique
        for (int i = 0; i < 100; i++) {
          final uuid = IdCore.randomString();
          expect(
            results.contains(uuid),
            false,
            reason: 'UUID should be unique but found duplicate: $uuid',
          );
          results.add(uuid);
        }

        expect(results.length, 100);
      });

      test('should contain hyphens in correct positions', () {
        final result = IdCore.randomString();

        expect(result[8], '-');
        expect(result[13], '-');
        expect(result[18], '-');
        expect(result[23], '-');
      });

      test('should have version 4 indicator', () {
        final result = IdCore.randomString();

        // The 13th character (index 14) should be '4' for UUID v4
        expect(result[14], '4');
      });

      test('should have valid variant bits', () {
        final result = IdCore.randomString();

        // The 17th character (index 19) should be 8, 9, a, or b for UUID v4
        final variantChar = result[19].toLowerCase();
        expect(['8', '9', 'a', 'b'].contains(variantChar), true);
      });
    });
  });
}
