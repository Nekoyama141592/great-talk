import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/consts/remote_config_constants.dart';

part 'chat_limit_per_day.freezed.dart';
part 'chat_limit_per_day.g.dart';

@freezed
abstract class ChatLimitPerDay implements _$ChatLimitPerDay {
  const ChatLimitPerDay._();
  const factory ChatLimitPerDay(
      {required int basic,
      required int free,
      required int premium}) = _ChatLimitPerDay;
  factory ChatLimitPerDay.fromJson(Map<String, dynamic> json) =>
      _$ChatLimitPerDayFromJson(json);
  factory ChatLimitPerDay.instance() => const ChatLimitPerDay(
      basic: RemoteConfigConstants.basicLimitPerDay,
      free: RemoteConfigConstants.freeLimitPerDay,
      premium: RemoteConfigConstants.premiumLimitPerDay);
}
