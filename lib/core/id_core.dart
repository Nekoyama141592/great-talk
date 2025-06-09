import 'package:uuid/uuid.dart';

class IdCore {
  static String randomString() {
    const uuid = Uuid();
    return uuid.v4();
  }
}
