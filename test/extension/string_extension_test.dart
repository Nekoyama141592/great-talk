import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/extension/string_extension.dart';

void main() {
  group('StringExtension', () {
    group('toRoundToSecondDecimalPlace', () {
      test('should parse and round valid decimal strings', () {
        expect('3.14159'.toRoundToSecondDecimalPlace(), 3.1);
        expect('2.0'.toRoundToSecondDecimalPlace(), 2.0);
        expect('1.05'.toRoundToSecondDecimalPlace(), 1.1);
        expect('1.04'.toRoundToSecondDecimalPlace(), 1.0);
      });

      test('should handle integer strings', () {
        expect('5'.toRoundToSecondDecimalPlace(), 5.0);
        expect('42'.toRoundToSecondDecimalPlace(), 42.0);
        expect('0'.toRoundToSecondDecimalPlace(), 0.0);
      });

      test('should handle negative numbers', () {
        expect('-3.14159'.toRoundToSecondDecimalPlace(), -3.1);
        expect('-1.05'.toRoundToSecondDecimalPlace(), -1.1);
        expect('-2'.toRoundToSecondDecimalPlace(), -2.0);
      });

      test('should throw FormatException for invalid strings', () {
        expect(() => 'invalid'.toRoundToSecondDecimalPlace(), 
               throwsA(isA<FormatException>()));
        expect(() => ''.toRoundToSecondDecimalPlace(), 
               throwsA(isA<FormatException>()));
        expect(() => '3.14.15'.toRoundToSecondDecimalPlace(), 
               throwsA(isA<FormatException>()));
      });
    });

    group('removeNewlinesAndSpaces', () {
      test('should remove newlines and spaces', () {
        expect('hello world'.removeNewlinesAndSpaces(), 'helloworld');
        expect('line1\nline2'.removeNewlinesAndSpaces(), 'line1line2');
        expect('  spaced  '.removeNewlinesAndSpaces(), 'spaced');
        expect('mixed \n content \n here'.removeNewlinesAndSpaces(), 'mixedcontenthere');
      });

      test('should handle strings without newlines or spaces', () {
        expect('nospacesnewlines'.removeNewlinesAndSpaces(), 'nospacesnewlines');
        expect(''.removeNewlinesAndSpaces(), '');
        expect('a'.removeNewlinesAndSpaces(), 'a');
      });

      test('should handle strings with only newlines and spaces', () {
        expect('   '.removeNewlinesAndSpaces(), '');
        expect('\n\n\n'.removeNewlinesAndSpaces(), '');
        expect(' \n \n '.removeNewlinesAndSpaces(), '');
      });

      test('should handle mixed whitespace characters', () {
        expect('tab\there'.removeNewlinesAndSpaces(), 'tab\there'); // tabs should remain
        expect('carriage\rreturn'.removeNewlinesAndSpaces(), 'carriage\rreturn'); // CR should remain
      });
    });

    group('invalidField', () {
      test('should return true for strings containing forbidden characters', () {
        expect('test.field'.invalidField, true);
        expect('[bracket]'.invalidField, true);
        expect('star*field'.invalidField, true);
        expect('back`tick'.invalidField, true);
        expect('complex[.]*field'.invalidField, true);
      });

      test('should return false for valid strings', () {
        expect('validfield'.invalidField, false);
        expect('valid_field'.invalidField, false);
        expect('valid-field'.invalidField, false);
        expect('ValidField123'.invalidField, false);
        expect('field with spaces'.invalidField, false);
      });

      test('should handle empty strings', () {
        expect(''.invalidField, false);
      });

      test('should handle strings with only forbidden characters', () {
        expect('...'.invalidField, true);
        expect('[[['.invalidField, true);
        expect('***'.invalidField, true);
        expect('```'.invalidField, true);
      });

      test('should check all forbidden characters from FormConsts', () {
        // Based on FormConsts.notUseOnField = ['.', '[', ']', '*', '`']
        expect('contains.dot'.invalidField, true);
        expect('contains[bracket'.invalidField, true);
        expect('contains]bracket'.invalidField, true);
        expect('contains*star'.invalidField, true);
        expect('contains`backtick'.invalidField, true);
      });

      test('should handle Unicode and special characters not in forbidden list', () {
        expect('こんにちは'.invalidField, false);
        expect('test@email.com'.invalidField, true); // contains '.'
        expect('test#hashtag'.invalidField, false);
        expect('test&ampersand'.invalidField, false);
        expect('test emoji 🚀'.invalidField, false);
      });
    });
  });
}