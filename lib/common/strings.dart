// packages
import 'package:uuid/uuid.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

String randomString() {
  const uuid = Uuid();
  return uuid.v4();
}

String getName(types.User person) => person.lastName ?? 'UNKNOWN';

// prefs_key
const lastChatDatePrefsKey = "lastChatDate";
const chatCountPrefsKey = "chatCount";