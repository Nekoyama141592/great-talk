import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/consts/form_consts.dart';
import 'package:great_talk/ui_core/validator/post_validator.dart';

void main() {
  group('PostValidator', () {
    group('isInValidPost', () {
      test('should return false for valid post data', () {
        const validTitle = 'Valid Title';
        const validDescription = 'Valid description text';
        const validPrompt = 'Valid system prompt text';

        final result = PostValidator.isInValidPost(
          validDescription,
          validPrompt,
          validTitle,
        );

        expect(result, isFalse);
      });

      test('should return true when title is invalid', () {
        const invalidTitle = ''; // Empty title
        const validDescription = 'Valid description';
        const validPrompt = 'Valid prompt';

        final result = PostValidator.isInValidPost(
          validDescription,
          validPrompt,
          invalidTitle,
        );

        expect(result, isTrue);
      });

      test('should return true when description is invalid', () {
        const validTitle = 'Valid Title';
        const invalidDescription = ''; // Empty description
        const validPrompt = 'Valid prompt';

        final result = PostValidator.isInValidPost(
          invalidDescription,
          validPrompt,
          validTitle,
        );

        expect(result, isTrue);
      });

      test('should return true when prompt is invalid', () {
        const validTitle = 'Valid Title';
        const validDescription = 'Valid description';
        const invalidPrompt = ''; // Empty prompt

        final result = PostValidator.isInValidPost(
          validDescription,
          invalidPrompt,
          validTitle,
        );

        expect(result, isTrue);
      });

      test('should return true when prompt is default system prompt', () {
        const validTitle = 'Valid Title';
        const validDescription = 'Valid description';
        const defaultPrompt = FormConsts.defaultSystemPrompt;

        final result = PostValidator.isInValidPost(
          validDescription,
          defaultPrompt,
          validTitle,
        );

        expect(result, isTrue);
      });

      test('should return true when title contains invalid characters', () {
        const invalidTitle = 'Title.with[invalid]*chars'; // Contains forbidden chars
        const validDescription = 'Valid description';
        const validPrompt = 'Valid prompt';

        final result = PostValidator.isInValidPost(
          validDescription,
          validPrompt,
          invalidTitle,
        );

        expect(result, isTrue);
      });

      test('should return true when multiple fields are invalid', () {
        const invalidTitle = '';
        const invalidDescription = '';
        const invalidPrompt = '';

        final result = PostValidator.isInValidPost(
          invalidDescription,
          invalidPrompt,
          invalidTitle,
        );

        expect(result, isTrue);
      });

      test('should return true when title exceeds maximum limit', () {
        final longTitle = 'a' * (FormConsts.maxTitleLimit + 1);
        const validDescription = 'Valid description';
        const validPrompt = 'Valid prompt';

        final result = PostValidator.isInValidPost(
          validDescription,
          validPrompt,
          longTitle,
        );

        expect(result, isTrue);
      });

      test('should return true when description exceeds maximum limit', () {
        const validTitle = 'Valid Title';
        final longDescription = 'a' * (FormConsts.maxDescriptionLimit + 1);
        const validPrompt = 'Valid prompt';

        final result = PostValidator.isInValidPost(
          longDescription,
          validPrompt,
          validTitle,
        );

        expect(result, isTrue);
      });

      test('should return true when prompt exceeds maximum limit', () {
        const validTitle = 'Valid Title';
        const validDescription = 'Valid description';
        final longPrompt = 'a' * (FormConsts.maxSystemPromptLimit + 1);

        final result = PostValidator.isInValidPost(
          validDescription,
          longPrompt,
          validTitle,
        );

        expect(result, isTrue);
      });
    });

    group('edge cases', () {
      test('should handle minimum valid lengths', () {
        const minTitle = 'a';
        const minDescription = 'a';
        const minPrompt = 'a';

        final result = PostValidator.isInValidPost(
          minDescription,
          minPrompt,
          minTitle,
        );

        expect(result, isFalse);
      });

      test('should handle maximum valid lengths', () {
        final maxTitle = 'a' * FormConsts.maxTitleLimit;
        final maxDescription = 'a' * FormConsts.maxDescriptionLimit;
        final maxPrompt = 'a' * FormConsts.maxSystemPromptLimit;

        final result = PostValidator.isInValidPost(
          maxDescription,
          maxPrompt,
          maxTitle,
        );

        expect(result, isFalse);
      });

      test('should handle whitespace-only strings', () {
        const whitespaceTitle = '   ';
        const whitespaceDescription = '   ';
        const whitespacePrompt = '   ';

        final result = PostValidator.isInValidPost(
          whitespaceDescription,
          whitespacePrompt,
          whitespaceTitle,
        );

        expect(result, isFalse); // Whitespace is considered valid content
      });

      test('should handle special characters in valid content', () {
        const titleWithSpecialChars = 'Title with émojis 🚀 and ñ';
        const descriptionWithSpecialChars = 'Description with special chars: @#%&';
        const promptWithSpecialChars = 'Prompt with unicode: αβγ';

        final result = PostValidator.isInValidPost(
          descriptionWithSpecialChars,
          promptWithSpecialChars,
          titleWithSpecialChars,
        );

        expect(result, isFalse);
      });

      test('should handle mixed valid and invalid fields', () {
        const validTitle = 'Valid Title';
        const validDescription = 'Valid description';
        const invalidPrompt = ''; // Only prompt is invalid

        final result = PostValidator.isInValidPost(
          validDescription,
          invalidPrompt,
          validTitle,
        );

        expect(result, isTrue); // Should be invalid if any field is invalid
      });
    });

    group('boundary testing', () {
      test('should reject when exactly one character over title limit', () {
        final title = 'a' * (FormConsts.maxTitleLimit + 1);
        const validDescription = 'Valid description';
        const validPrompt = 'Valid prompt';

        final result = PostValidator.isInValidPost(
          validDescription,
          validPrompt,
          title,
        );

        expect(result, isTrue);
      });

      test('should accept when exactly at title limit', () {
        final title = 'a' * FormConsts.maxTitleLimit;
        const validDescription = 'Valid description';
        const validPrompt = 'Valid prompt';

        final result = PostValidator.isInValidPost(
          validDescription,
          validPrompt,
          title,
        );

        expect(result, isFalse);
      });

      test('should reject when exactly one character over description limit', () {
        const validTitle = 'Valid Title';
        final description = 'a' * (FormConsts.maxDescriptionLimit + 1);
        const validPrompt = 'Valid prompt';

        final result = PostValidator.isInValidPost(
          description,
          validPrompt,
          validTitle,
        );

        expect(result, isTrue);
      });

      test('should reject when exactly one character over prompt limit', () {
        const validTitle = 'Valid Title';
        const validDescription = 'Valid description';
        final prompt = 'a' * (FormConsts.maxSystemPromptLimit + 1);

        final result = PostValidator.isInValidPost(
          validDescription,
          prompt,
          validTitle,
        );

        expect(result, isTrue);
      });
    });

    group('form constants integration', () {
      test('should use correct limits from FormConsts', () {
        expect(FormConsts.maxTitleLimit, equals(32));
        expect(FormConsts.maxDescriptionLimit, equals(1000));
        expect(FormConsts.maxSystemPromptLimit, equals(1000));
      });

      test('should validate against default system prompt correctly', () {
        const validTitle = 'Valid Title';
        const validDescription = 'Valid description';
        
        final result = PostValidator.isInValidPost(
          validDescription,
          FormConsts.defaultSystemPrompt,
          validTitle,
        );

        expect(result, isTrue);
      });
    });
  });
}