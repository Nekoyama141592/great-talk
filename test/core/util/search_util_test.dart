import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/core/util/search_util.dart';

void main() {
  group('SearchUtil', () {
    group('returnSearchToken', () {
      test(
        'should return map with search words as keys and true as values',
        () {
          const searchTerm = 'hello';
          final result = SearchUtil.returnSearchToken(searchTerm);

          expect(result, isA<Map<String, dynamic>>());
          expect(result['he'], true);
          expect(result['el'], true);
          expect(result['ll'], true);
          expect(result['lo'], true);
        },
      );

      test('should handle single character input', () {
        const searchTerm = 'a';
        final result = SearchUtil.returnSearchToken(searchTerm);

        expect(result, isA<Map<String, dynamic>>());
        expect(result['a'], true);
        expect(result.length, 1);
      });

      test('should handle empty input', () {
        const searchTerm = '';
        final result = SearchUtil.returnSearchToken(searchTerm);

        expect(result, isA<Map<String, dynamic>>());
        expect(result.isEmpty, true);
      });

      test('should handle input with special characters', () {
        const searchTerm = 'test.word';
        final result = SearchUtil.returnSearchToken(searchTerm);

        expect(result.keys.any((key) => key.contains('.')), false);
      });
    });

    group('returnSearchWords', () {
      test('should return bi-gram tokens for normal input', () {
        const searchTerm = 'hello';
        final result = SearchUtil.returnSearchWords(searchTerm);

        expect(result, ['he', 'el', 'll', 'lo']);
      });

      test('should return single token for input shorter than nGramIndex', () {
        const searchTerm = 'a';
        final result = SearchUtil.returnSearchWords(searchTerm);

        expect(result, ['a']);
      });

      test('should return single token for input equal to nGramIndex', () {
        const searchTerm = 'ab';
        final result = SearchUtil.returnSearchWords(searchTerm);

        expect(result, ['ab']);
      });

      test('should convert input to lowercase', () {
        const searchTerm = 'HELLO';
        final result = SearchUtil.returnSearchWords(searchTerm);

        expect(result, ['he', 'el', 'll', 'lo']);
        expect(result.every((word) => word == word.toLowerCase()), true);
      });

      test('should filter out special characters', () {
        const searchTerm = 'hel.lo';
        final result = SearchUtil.returnSearchWords(searchTerm);

        expect(result, ['he', 'el', 'll', 'lo']);
        expect(result.any((word) => word.contains('.')), false);
      });

      test('should handle mixed case and special characters', () {
        const searchTerm = 'Hello*World!';
        final result = SearchUtil.returnSearchWords(searchTerm);

        expect(result.every((word) => word == word.toLowerCase()), true);
        expect(result.any((word) => word.contains('*')), false);
      });

      test('should handle input with multiple special characters', () {
        const searchTerm = 'te.st[wo]rd';
        final result = SearchUtil.returnSearchWords(searchTerm);

        expect(result.any((word) => word.contains('.')), false);
        expect(result.any((word) => word.contains('[')), false);
        expect(result.any((word) => word.contains(']')), false);
      });

      test('should handle Unicode characters', () {
        const searchTerm = 'こんにちは';
        final result = SearchUtil.returnSearchWords(searchTerm);

        expect(result, ['こん', 'んに', 'にち', 'ちは']);
      });

      test('should handle empty string after filtering', () {
        const searchTerm = '....';
        final result = SearchUtil.returnSearchWords(searchTerm);

        expect(result, []);
      });

      test('should handle input with only special characters', () {
        const searchTerm = '.*[]';
        final result = SearchUtil.returnSearchWords(searchTerm);

        expect(result, []);
      });

      test('should generate correct number of bi-grams', () {
        const searchTerm = 'testing';
        final result = SearchUtil.returnSearchWords(searchTerm);

        expect(result.length, 6);
        expect(result, ['te', 'es', 'st', 'ti', 'in', 'ng']);
      });

      test('should handle whitespace', () {
        const searchTerm = 'hello world';
        final result = SearchUtil.returnSearchWords(searchTerm);

        expect(result.any((word) => word.contains(' ')), true);
      });
    });
  });
}
