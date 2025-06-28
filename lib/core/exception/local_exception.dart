class LocalException implements Exception {
  const LocalException._(this.message, {this.code});

  final String message;
  final String? code;

  // エラーコード定数
  static const String _fetchError = 'FETCH_ERROR';
  static const String _addError = 'ADD_ERROR';
  static const String _removeError = 'REMOVE_ERROR';
  static const String _getBoolError = 'GET_BOOL_ERROR';
  static const String _getStringError = 'GET_STRING_ERROR';
  static const String _setStringError = 'SET_STRING_ERROR';
  static const String _setBoolError = 'SET_BOOL_ERROR';
  static const String _jsonParseError = 'JSON_PARSE_ERROR';
  static const String _serializationError = 'SERIALIZATION_ERROR';

  // ファクトリーコンストラクタ
  factory LocalException.fetch(String message) =>
      LocalException._(message, code: _fetchError);

  factory LocalException.add(String message) =>
      LocalException._(message, code: _addError);

  factory LocalException.remove(String message) =>
      LocalException._(message, code: _removeError);

  factory LocalException.getBool(String message) =>
      LocalException._(message, code: _getBoolError);

  factory LocalException.getString(String message) =>
      LocalException._(message, code: _getStringError);

  factory LocalException.setString(String message) =>
      LocalException._(message, code: _setStringError);

  factory LocalException.setBool(String message) =>
      LocalException._(message, code: _setBoolError);

  factory LocalException.jsonParse(String message) =>
      LocalException._(message, code: _jsonParseError);

  factory LocalException.serialization(String message) =>
      LocalException._(message, code: _serializationError);

  @override
  String toString() {
    if (code != null) {
      return 'LocalException($code): $message';
    }
    return 'LocalException: $message';
  }
}
