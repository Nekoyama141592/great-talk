import 'package:great_talk/infrastructure/repository/result/result.dart';

/// Utility class for common form validation patterns
class FormValidationUtil {
  /// Validates that a field is not empty
  static Result<String> validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return Result.failure('$fieldNameは必須です');
    }
    return Result.success(value.trim());
  }

  /// Validates multiple required fields at once
  /// Returns the first validation error encountered, or success if all pass
  static Result<Map<String, String>> validateMultipleRequired(
    Map<String, String?> fields,
  ) {
    final validatedFields = <String, String>{};

    for (final entry in fields.entries) {
      final result = validateRequired(entry.value, entry.key);
      final failure = result.whenOrNull(failure: (error) => error);
      if (failure != null) {
        return Result.failure(failure);
      }
      final value = result.when(
        success: (value) => value,
        failure: (_) => '', // This won't be reached due to check above
      );
      validatedFields[entry.key] = value;
    }

    return Result.success(validatedFields);
  }

  /// Validates text length within specified bounds
  static Result<String> validateLength(
    String? value,
    String fieldName, {
    int? minLength,
    int? maxLength,
  }) {
    if (value == null) {
      return Result.failure('$fieldNameが入力されていません');
    }

    final trimmedValue = value.trim();

    if (minLength != null && trimmedValue.length < minLength) {
      return Result.failure('$fieldNameは$minLength文字以上で入力してください');
    }

    if (maxLength != null && trimmedValue.length > maxLength) {
      return Result.failure('$fieldNameは$maxLength文字以内で入力してください');
    }

    return Result.success(trimmedValue);
  }

  /// Validates that a value is not in a list of invalid values
  static Result<String> validateNotInList(
    String? value,
    List<String> invalidValues,
    String fieldName,
  ) {
    if (value == null || value.trim().isEmpty) {
      return Result.failure('$fieldNameは必須です');
    }

    final trimmedValue = value.trim();

    if (invalidValues.contains(trimmedValue)) {
      return Result.failure('$fieldNameに無効な値が入力されています');
    }

    return Result.success(trimmedValue);
  }

  /// Validates email format
  static Result<String> validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return const Result.failure('メールアドレスを入力してください');
    }

    final trimmedEmail = email.trim();
    final emailRegex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

    if (!emailRegex.hasMatch(trimmedEmail)) {
      return const Result.failure('正しいメールアドレスを入力してください');
    }

    return Result.success(trimmedEmail);
  }

  /// Validates password strength
  static Result<String> validatePassword(
    String? password, {
    int minLength = 6,
    bool requireUppercase = false,
    bool requireLowercase = false,
    bool requireNumbers = false,
    bool requireSpecialChars = false,
  }) {
    if (password == null || password.isEmpty) {
      return const Result.failure('パスワードを入力してください');
    }

    if (password.length < minLength) {
      return Result.failure('パスワードは$minLength文字以上で入力してください');
    }

    if (requireUppercase && !password.contains(RegExp(r'[A-Z]'))) {
      return const Result.failure('パスワードには大文字を含めてください');
    }

    if (requireLowercase && !password.contains(RegExp(r'[a-z]'))) {
      return const Result.failure('パスワードには小文字を含めてください');
    }

    if (requireNumbers && !password.contains(RegExp(r'[0-9]'))) {
      return const Result.failure('パスワードには数字を含めてください');
    }

    if (requireSpecialChars &&
        !password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return const Result.failure('パスワードには特殊文字を含めてください');
    }

    return Result.success(password);
  }

  /// Validates that two passwords match
  static Result<String> validatePasswordMatch(
    String? password,
    String? confirmPassword,
  ) {
    if (password == null || password.isEmpty) {
      return const Result.failure('パスワードを入力してください');
    }

    if (confirmPassword == null || confirmPassword.isEmpty) {
      return const Result.failure('確認用パスワードを入力してください');
    }

    if (password != confirmPassword) {
      return const Result.failure('パスワードが一致しません');
    }

    return Result.success(password);
  }

  /// Validates URL format
  static Result<String> validateUrl(String? url) {
    if (url == null || url.trim().isEmpty) {
      return const Result.failure('URLを入力してください');
    }

    final trimmedUrl = url.trim();

    try {
      final uri = Uri.parse(trimmedUrl);
      if (!uri.hasScheme || (!uri.isScheme('http') && !uri.isScheme('https'))) {
        return const Result.failure(
          '正しいURLを入力してください (http:// または https:// で始まる)',
        );
      }
      return Result.success(trimmedUrl);
    } catch (e) {
      return const Result.failure('正しいURLを入力してください');
    }
  }

  /// Validates numeric input
  static Result<num> validateNumber(
    String? value,
    String fieldName, {
    num? min,
    num? max,
  }) {
    if (value == null || value.trim().isEmpty) {
      return Result.failure('$fieldNameを入力してください');
    }

    final trimmedValue = value.trim();
    final number = num.tryParse(trimmedValue);

    if (number == null) {
      return Result.failure('$fieldNameには数値を入力してください');
    }

    if (min != null && number < min) {
      return Result.failure('$fieldNameは$min以上で入力してください');
    }

    if (max != null && number > max) {
      return Result.failure('$fieldNameは$max以下で入力してください');
    }

    return Result.success(number);
  }

  /// Validates integer input
  static Result<int> validateInteger(
    String? value,
    String fieldName, {
    int? min,
    int? max,
  }) {
    if (value == null || value.trim().isEmpty) {
      return Result.failure('$fieldNameを入力してください');
    }

    final trimmedValue = value.trim();
    final integer = int.tryParse(trimmedValue);

    if (integer == null) {
      return Result.failure('$fieldNameには整数を入力してください');
    }

    if (min != null && integer < min) {
      return Result.failure('$fieldNameは$min以上で入力してください');
    }

    if (max != null && integer > max) {
      return Result.failure('$fieldNameは$max以下で入力してください');
    }

    return Result.success(integer);
  }

  /// Validates phone number format (basic Japanese format)
  static Result<String> validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.trim().isEmpty) {
      return const Result.failure('電話番号を入力してください');
    }

    final trimmedPhone = phoneNumber.trim().replaceAll(RegExp(r'[^\d]'), '');

    if (trimmedPhone.length < 10 || trimmedPhone.length > 11) {
      return const Result.failure('正しい電話番号を入力してください');
    }

    return Result.success(trimmedPhone);
  }

  /// Validates that a selection is made from a list of options
  static Result<T> validateSelection<T>(T? value, String fieldName) {
    if (value == null) {
      return Result.failure('$fieldNameを選択してください');
    }

    return Result.success(value);
  }

  /// Validates that at least one item is selected from a list
  static Result<List<T>> validateAtLeastOneSelection<T>(
    List<T>? selections,
    String fieldName,
  ) {
    if (selections == null || selections.isEmpty) {
      return Result.failure('$fieldNameを少なくとも1つ選択してください');
    }

    return Result.success(selections);
  }

  /// Validates date format and range
  static Result<DateTime> validateDate(
    String? dateString,
    String fieldName, {
    DateTime? minDate,
    DateTime? maxDate,
  }) {
    if (dateString == null || dateString.trim().isEmpty) {
      return Result.failure('$fieldNameを入力してください');
    }

    final date = DateTime.tryParse(dateString.trim());

    if (date == null) {
      return Result.failure('$fieldNameの形式が正しくありません');
    }

    if (minDate != null && date.isBefore(minDate)) {
      return Result.failure(
        '$fieldNameは${minDate.toString().split(' ')[0]}以降の日付を選択してください',
      );
    }

    if (maxDate != null && date.isAfter(maxDate)) {
      return Result.failure(
        '$fieldNameは${maxDate.toString().split(' ')[0]}以前の日付を選択してください',
      );
    }

    return Result.success(date);
  }

  /// Combines multiple validation results
  /// Returns the first failure encountered, or success if all pass
  static Result<List<T>> combineValidationResults<T>(
    List<Result<T>> validationResults,
  ) {
    final validatedValues = <T>[];

    for (final result in validationResults) {
      final failure = result.whenOrNull(failure: (error) => error);
      if (failure != null) {
        return Result.failure(failure);
      }
      final value = result.when(
        success: (value) => value,
        failure:
            (_) =>
                throw StateError(
                  'This should not happen',
                ), // This won't be reached due to check above
      );
      validatedValues.add(value);
    }

    return Result.success(validatedValues);
  }
}
