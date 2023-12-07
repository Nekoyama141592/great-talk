import 'package:great_talk/consts/form_consts.dart';
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
        description.length > FormConsts.maxDescriptionLimit;
    return result;
  }

  static bool _isInValidSystemPrompt(String? prompt) {
    final result = prompt == null ||
        prompt.isEmpty ||
        prompt.length > FormConsts.maxSystemPromptLimit;
    return result;
  }

  static bool _isInValidTitle(String? title) {
    final result = title == null ||
        title.isEmpty ||
        title.length > FormConsts.maxTitleLimit;
    return result;
  }

  static bool _isInValidTemperature(String? temperature) {
    final result = temperature == null ||
        temperature.isEmpty ||
        double.tryParse(temperature) == null ||
        temperature.toRoundToSecondDecimalPlace() < 0.0 ||
        temperature.toRoundToSecondDecimalPlace() > 2.0;
    return result;
  }

  static bool _isInValidTopP(String? topP) {
    final result = topP == null ||
        topP.isEmpty ||
        double.tryParse(topP) == null ||
        topP.toRoundToSecondDecimalPlace() < 0.0 ||
        topP.toRoundToSecondDecimalPlace() > 1.0;
    return result;
  }

  static bool _isInValidPresencePenalty(String? presencePenalty) {
    final result = presencePenalty == null ||
        presencePenalty.isEmpty ||
        double.tryParse(presencePenalty) == null ||
        presencePenalty.toRoundToSecondDecimalPlace() < -2.0 ||
        presencePenalty.toRoundToSecondDecimalPlace() > 2.0;
    return result;
  }

  static bool _isInValidFrequencyPenalty(String? frequencyPenalty) {
    final result = frequencyPenalty == null ||
        frequencyPenalty.isEmpty ||
        double.tryParse(frequencyPenalty) == null ||
        frequencyPenalty.toRoundToSecondDecimalPlace() < -2.0 ||
        frequencyPenalty.toRoundToSecondDecimalPlace() > 2.0;
    return result;
  }
}
