import 'dart:io';

extension RemoteConfigKeyExtension on String {
  String get toOsSpecificRemoteConfigKey =>
      Platform.isIOS ? "ios_$this" : "android_$this";
}
