import 'package:great_talk/consts/ui/form_consts.dart';
import 'package:great_talk/core/extension/string_extension.dart';

class PostValidator {
  static bool isInValidPost(String description, String prompt, String title) {
    final result =
        _isInValidDescription(description) ||
        _isInValidSystemPrompt(prompt) ||
        _isInValidTitle(title) ||
        title.invalidField ||
        prompt == FormConsts.defaultSystemPrompt;
    return result;
  }

  static bool _isInValidDescription(String? description) {
    final result =
        description == null ||
        description.isEmpty ||
        description.length > FormConsts.maxDescriptionLimit;
    return result;
  }

  static bool _isInValidSystemPrompt(String? prompt) {
    final result =
        prompt == null ||
        prompt.isEmpty ||
        prompt.length > FormConsts.maxSystemPromptLimit;
    return result;
  }

  static bool _isInValidTitle(String? title) {
    final result =
        title == null ||
        title.isEmpty ||
        title.length > FormConsts.maxTitleLimit;
    return result;
  }
}
