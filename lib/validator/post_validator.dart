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
    return _isInValidDescription(description) ||
        _isInValidSystemPrompt(prompt) ||
        _isInValidTitle(title) ||
        _isInValidTemperature(temperature) ||
        _isInValidTopP(topP) ||
        _isInValidPresencePenalty(presencePenalty) ||
        _isInValidFrequencyPenalty(frequencyPenalty);
  }

  static bool _isInValidDescription(String? description) {
    return description == null ||
        description.isEmpty ||
        description.length > maxDescriptionLimit;
  }

  static bool _isInValidSystemPrompt(String? prompt) {
    return prompt == null ||
        prompt.isEmpty ||
        prompt.length > maxSystemPromptLimit;
  }

  static bool _isInValidTitle(String? title) {
    return title == null || title.isEmpty || title.length > maxTitleLimit;
  }

  static bool _isInValidTemperature(String? temperature) {
    return temperature == null ||
        temperature.isEmpty ||
        double.tryParse(temperature) == null ||
        temperature.toDouble() < 0.0 ||
        temperature.toDouble() > 2.0;
  }

  static bool _isInValidTopP(String? topP) {
    return topP == null ||
        topP.isEmpty ||
        double.tryParse(topP) == null ||
        topP.toDouble() < 0.0 ||
        topP.toDouble() > 1.0;
  }

  static bool _isInValidPresencePenalty(String? presencePenalty) {
    return presencePenalty == null ||
        presencePenalty.isEmpty ||
        double.tryParse(presencePenalty) == null ||
        presencePenalty.toDouble() < -2.0 ||
        presencePenalty.toDouble() > 2.0;
  }

  static bool _isInValidFrequencyPenalty(String? frequencyPenalty) {
    return frequencyPenalty == null ||
        frequencyPenalty.isEmpty ||
        double.tryParse(frequencyPenalty) == null ||
        frequencyPenalty.toDouble() < -2.0 ||
        frequencyPenalty.toDouble() > 2.0;
  }
}
