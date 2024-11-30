import 'dart:convert';

class JsonCore {
  static Map<String, dynamic> encodeDecode(dynamic data) {
    final encoded = json.encode(data);
    final decoded = json.decode(encoded);
    return decoded;
  }
}
