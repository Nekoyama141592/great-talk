import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/extension/shared_preferences_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('SharedPreferencesExtension', () {
    late SharedPreferences prefs;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      prefs = await SharedPreferences.getInstance();
    });

    group('getJson', () {
      test('should return null when key does not exist', () {
        final result = prefs.getJson('nonexistent_key');
        expect(result, isNull);
      });

      test('should return Map when valid JSON exists', () async {
        const testData = {'name': 'John', 'age': 30, 'active': true};
        await prefs.setString('test_key', json.encode(testData));

        final result = prefs.getJson('test_key');
        expect(result, equals(testData));
        expect(result?['name'], equals('John'));
        expect(result?['age'], equals(30));
        expect(result?['active'], equals(true));
      });

      test('should handle nested objects correctly', () async {
        const testData = {
          'user': {
            'profile': {'name': 'John', 'email': 'john@test.com'},
            'settings': {'theme': 'dark', 'notifications': true},
          },
          'metadata': {'version': '1.0', 'created': '2024-01-01'},
        };
        await prefs.setString('nested_key', json.encode(testData));

        final result = prefs.getJson('nested_key');
        expect(result, equals(testData));
        expect(result?['user']?['profile']?['name'], equals('John'));
        expect(result?['user']?['settings']?['theme'], equals('dark'));
      });

      test('should handle empty object', () async {
        const testData = <String, dynamic>{};
        await prefs.setString('empty_key', json.encode(testData));

        final result = prefs.getJson('empty_key');
        expect(result, equals(testData));
        expect(result?.isEmpty, isTrue);
      });

      test('should throw exception for invalid JSON', () async {
        await prefs.setString('invalid_key', '{invalid_json}');

        expect(
          () => prefs.getJson('invalid_key'),
          throwsA(isA<FormatException>()),
        );
      });
    });

    group('getJsonList', () {
      test('should return null when key does not exist', () {
        final result = prefs.getJsonList('nonexistent_list');
        expect(result, isNull);
      });

      test(
        'should return List<Map<String, dynamic>> when valid JSON array exists',
        () async {
          const testData = [
            {'id': 1, 'name': 'Item 1'},
            {'id': 2, 'name': 'Item 2'},
            {'id': 3, 'name': 'Item 3'},
          ];
          await prefs.setString('test_list', json.encode(testData));

          final result = prefs.getJsonList('test_list');
          expect(result, equals(testData));
          expect(result?.length, equals(3));
          expect(result?[0]['name'], equals('Item 1'));
          expect(result?[2]['id'], equals(3));
        },
      );

      test('should handle empty array', () async {
        const testData = <Map<String, dynamic>>[];
        await prefs.setString('empty_list', json.encode(testData));

        final result = prefs.getJsonList('empty_list');
        expect(result, equals(testData));
        expect(result?.isEmpty, isTrue);
      });

      test('should handle complex objects in array', () async {
        const testData = [
          {
            'user': {'name': 'John', 'age': 30},
            'posts': [
              {'title': 'Post 1'},
              {'title': 'Post 2'},
            ],
          },
          {
            'user': {'name': 'Jane', 'age': 25},
            'posts': [
              {'title': 'Post 3'},
            ],
          },
        ];
        await prefs.setString('complex_list', json.encode(testData));

        final result = prefs.getJsonList('complex_list');
        expect(result, equals(testData));
        expect(result?[0]['user']['name'], equals('John'));
        expect(result?[1]['posts'][0]['title'], equals('Post 3'));
      });

      test('should throw exception for invalid JSON array', () async {
        await prefs.setString('invalid_list', '[{invalid_json}]');

        expect(
          () => prefs.getJsonList('invalid_list'),
          throwsA(isA<FormatException>()),
        );
      });
    });

    group('getImage', () {
      test('should return null when key does not exist', () {
        final result = prefs.getImage('nonexistent_image');
        expect(result, isNull);
      });

      test('should return Uint8List when valid base64 exists', () async {
        final testBytes = Uint8List.fromList([1, 2, 3, 4, 5]);
        final base64String = base64Encode(testBytes);
        await prefs.setString('test_image', base64String);

        final result = prefs.getImage('test_image');
        expect(result, equals(testBytes));
        expect(result?.length, equals(5));
      });

      test('should handle empty image data', () async {
        final emptyBytes = Uint8List.fromList([]);
        final base64String = base64Encode(emptyBytes);
        await prefs.setString('empty_image', base64String);

        final result = prefs.getImage('empty_image');
        expect(result, equals(emptyBytes));
        expect(result?.length, equals(0));
      });

      test('should throw exception for invalid base64', () async {
        await prefs.setString('invalid_image', 'invalid_base64_data');

        expect(
          () => prefs.getImage('invalid_image'),
          throwsA(isA<FormatException>()),
        );
      });
    });

    group('setJson', () {
      test('should store Map as JSON string', () async {
        const testData = {'name': 'John', 'age': 30, 'active': true};

        await prefs.setJson('test_json', testData);

        final stored = prefs.getString('test_json');
        final decoded = json.decode(stored!) as Map<String, dynamic>;
        expect(decoded, equals(testData));
      });

      test('should handle nested objects', () async {
        const testData = {
          'user': {
            'profile': {'name': 'John', 'email': 'john@test.com'},
            'preferences': {'theme': 'dark', 'lang': 'en'},
          },
        };

        await prefs.setJson('nested_json', testData);

        final result = prefs.getJson('nested_json');
        expect(result, equals(testData));
      });

      test('should handle empty object', () async {
        const testData = <String, dynamic>{};

        await prefs.setJson('empty_json', testData);

        final result = prefs.getJson('empty_json');
        expect(result, equals(testData));
      });
    });

    group('setJsonList', () {
      test('should store List<Map<String, dynamic>> as JSON string', () async {
        const testData = [
          {'id': 1, 'name': 'Item 1'},
          {'id': 2, 'name': 'Item 2'},
        ];

        await prefs.setJsonList('test_json_list', testData);

        final stored = prefs.getString('test_json_list');
        final decoded = json.decode(stored!) as List<dynamic>;
        expect(decoded, equals(testData));
      });

      test('should handle empty list', () async {
        const testData = <Map<String, dynamic>>[];

        await prefs.setJsonList('empty_json_list', testData);

        final result = prefs.getJsonList('empty_json_list');
        expect(result, equals(testData));
      });

      test('should handle complex objects in list', () async {
        const testData = [
          {
            'user': {'name': 'John'},
            'metadata': {'created': '2024-01-01'},
          },
        ];

        await prefs.setJsonList('complex_json_list', testData);

        final result = prefs.getJsonList('complex_json_list');
        expect(result, equals(testData));
      });
    });

    group('setImage', () {
      test('should store Uint8List as base64 string', () async {
        final testBytes = Uint8List.fromList([1, 2, 3, 4, 5]);

        await prefs.setImage('test_image_store', testBytes);

        final stored = prefs.getString('test_image_store');
        final expectedBase64 = base64Encode(testBytes);
        expect(stored, equals(expectedBase64));
      });

      test('should handle empty image data', () async {
        final emptyBytes = Uint8List.fromList([]);

        await prefs.setImage('empty_image_store', emptyBytes);

        final result = prefs.getImage('empty_image_store');
        expect(result, equals(emptyBytes));
      });

      test('should handle large image data', () async {
        final largeBytes = Uint8List.fromList(
          List.generate(1000, (i) => i % 256),
        );

        await prefs.setImage('large_image', largeBytes);

        final result = prefs.getImage('large_image');
        expect(result, equals(largeBytes));
        expect(result?.length, equals(1000));
      });
    });

    group('round-trip operations', () {
      test('should maintain data integrity for JSON round-trip', () async {
        const original = {
          'string': 'test',
          'number': 42,
          'boolean': true,
          'null': null,
          'array': [1, 2, 3],
          'object': {'nested': 'value'},
        };

        await prefs.setJson('roundtrip_json', original);
        final result = prefs.getJson('roundtrip_json');

        expect(result, equals(original));
      });

      test('should maintain data integrity for JSON list round-trip', () async {
        const original = [
          {
            'id': 1,
            'data': [1, 2, 3],
          },
          {
            'id': 2,
            'data': [4, 5, 6],
          },
        ];

        await prefs.setJsonList('roundtrip_list', original);
        final result = prefs.getJsonList('roundtrip_list');

        expect(result, equals(original));
      });

      test('should maintain data integrity for image round-trip', () async {
        final original = Uint8List.fromList([255, 128, 64, 32, 16, 8, 4, 2, 1]);

        await prefs.setImage('roundtrip_image', original);
        final result = prefs.getImage('roundtrip_image');

        expect(result, equals(original));
      });
    });

    group('error handling', () {
      test('should handle concurrent operations', () async {
        const testData = {'concurrent': 'test'};

        final futures = List.generate(
          5,
          (i) => prefs.setJson('concurrent_$i', {...testData, 'index': i}),
        );

        await Future.wait(futures);

        for (int i = 0; i < 5; i++) {
          final result = prefs.getJson('concurrent_$i');
          expect(result?['concurrent'], equals('test'));
          expect(result?['index'], equals(i));
        }
      });

      test('should handle special characters in data', () async {
        const testData = {
          'special': 'ñ€£¥§©®™',
          'unicode': '🚀💯📱',
          'quotes': '"Hello"',
          'backslashes': '\\path\\to\\file',
        };

        await prefs.setJson('special_chars', testData);
        final result = prefs.getJson('special_chars');

        expect(result, equals(testData));
      });
    });
  });
}
