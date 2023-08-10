import 'package:great_talk/common/ints.dart';
import 'package:great_talk/extensions/string_extension.dart';

class PostValidator {
  static bool isInValidPost(
      String? description,
      String? prompt,
      String? title,
      String? temperature,
      String? topP,
      String? presencePenalty,
      String? frequencyPenalty) {
    final result = _isInValidDescription(description) ||
        _isInValidSystemPrompt(prompt) ||
        _isInValidTitle(title) ||
        _isInValidTemperature(temperature) ||
        _isInValidTopP(topP) ||
        _isInValidPresencePenalty(presencePenalty) ||
        _isInValidFrequencyPenalty(frequencyPenalty);
    return result;
  }

  static bool _isInValidDescription(String? description) {
    final result = description == null ||
        description.isEmpty ||
        description.length > maxDescriptionLimit;
    return result;
  }

  static bool _isInValidSystemPrompt(String? prompt) {
    final result = prompt == null ||
        prompt.isEmpty ||
        prompt.length > maxSystemPromptLimit;
    return result;
  }

  static bool _isInValidTitle(String? title) {
    final result =
        title == null || title.isEmpty || title.length > maxTitleLimit;
    return result;
  }

  static bool _isInValidTemperature(String? temperature) {
    final result = temperature == null ||
        temperature.isEmpty ||
        double.tryParse(temperature) == null ||
        temperature.toDouble() < 0.0 ||
        temperature.toDouble() > 2.0;
    return result;
  }

  static bool _isInValidTopP(String? topP) {
    final result = topP == null ||
        topP.isEmpty ||
        double.tryParse(topP) == null ||
        topP.toDouble() < 0.0 ||
        topP.toDouble() > 1.0;
    return result;
  }

  static bool _isInValidPresencePenalty(String? presencePenalty) {
    final result = presencePenalty == null ||
        presencePenalty.isEmpty ||
        double.tryParse(presencePenalty) == null ||
        presencePenalty.toDouble() < -2.0 ||
        presencePenalty.toDouble() > 2.0;
    return result;
  }

  static bool _isInValidFrequencyPenalty(String? frequencyPenalty) {
    final result = frequencyPenalty == null ||
        frequencyPenalty.isEmpty ||
        double.tryParse(frequencyPenalty) == null ||
        frequencyPenalty.toDouble() < -2.0 ||
        frequencyPenalty.toDouble() > 2.0;
    return result;
  }
}
