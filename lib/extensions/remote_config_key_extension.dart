import 'dart:io';

extension RemoteConfigKeyExtension on String {
  String toOsSpecificRemoteConfigKey() =>
      Platform.isIOS ? "ios_$this" : "android_$this";
}
