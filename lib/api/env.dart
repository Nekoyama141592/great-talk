import 'package:flutter_dotenv/flutter_dotenv.dart';

class ENV {
  static String getVerifyIosEndpoint() {
    return dotenv.get("DEV_VERIFY_IOS_ENDPOINT");
  }
  static String getVerifyAndroidEndpoint() {
    return dotenv.get("DEV_VERIFY_ANDROID_ENDPOINT");
  }
}