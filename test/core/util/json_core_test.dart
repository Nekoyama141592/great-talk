import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/core/util/json_core.dart';

void main() {
  group('JsonCore', () {
    group('encodeDecode', () {
      test('should encode and decode a simple map', () {
        final input = {'name': 'John', 'age': 30};
        final result = JsonCore.cast(input);

        expect(result, isA<Map<String, dynamic>>());
        expect(result['name'], 'John');
        expect(result['age'], 30);
      });

      test('should encode and decode a complex nested structure', () {
        final input = {
          'user': {
            'id': 123,
            'name': 'John Doe',
            'settings': {'theme': 'dark', 'notifications': true},
          },
        };

        final result = JsonCore.cast(input);

        expect(result, isA<Map<String, dynamic>>());
        expect(result['user']['name'], 'John Doe');
        expect(result['user']['settings']['theme'], 'dark');
      });

      test('should handle empty map', () {
        final emptyMap = <String, dynamic>{};
        final mapResult = JsonCore.cast(emptyMap);
        expect(mapResult, isA<Map<String, dynamic>>());
        expect(mapResult.isEmpty, true);
      });

      test('should handle special characters and Unicode', () {
        final input = {
          'special': 'Hello "World" with \n newlines',
          'unicode': '日本語 🚀 emoji',
          'symbols': '!@#\$%^&*()',
        };

        final result = JsonCore.cast(input);

        expect(result['special'], 'Hello "World" with \n newlines');
        expect(result['unicode'], '日本語 🚀 emoji');
        expect(result['symbols'], '!@#\$%^&*()');
      });

      test('should preserve data types after encode/decode cycle', () {
        final input = {
          'string': 'text',
          'int': 42,
          'double': 3.14,
          'bool': false,
          'null': null,
          'map': {'nested': 'value'},
        };

        final result = JsonCore.cast(input);

        expect(result['string'], isA<String>());
        expect(result['int'], isA<int>());
        expect(result['double'], isA<double>());
        expect(result['bool'], isA<bool>());
        expect(result['null'], isNull);
        expect(result['map'], isA<Map>());
      });
    });
  });
}
