import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/consts/remote_config_constants.dart';

part 'chat_limit_per_day.freezed.dart';
part 'chat_limit_per_day.g.dart';

@freezed
abstract class ChatLimitPerDay with _$ChatLimitPerDay {
  const ChatLimitPerDay._();
  const factory ChatLimitPerDay({
    @Default(RemoteConfigConstants.basicLimitPerDay) int basic,
    @Default(RemoteConfigConstants.freeLimitPerDay) int free,
    @Default(RemoteConfigConstants.premiumLimitPerDay) int premium,
  }) = _ChatLimitPerDay;
  factory ChatLimitPerDay.fromJson(Map<String, dynamic> json) =>
      _$ChatLimitPerDayFromJson(json);
}
