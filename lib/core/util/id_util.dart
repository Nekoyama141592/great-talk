import 'package:uuid/uuid.dart';

class IdUtil {
  static String randomString() {
    const uuid = Uuid();
    return uuid.v4();
  }
}
