import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/controllers/purchases_controller.dart';

part 'chat_count_today.freezed.dart';
part 'chat_count_today.g.dart';

@freezed
abstract class ChatCountToday implements _$ChatCountToday {
  const ChatCountToday._();
  const factory ChatCountToday(
      {@Default(0) int basic, @Default(0) int premium}) = _ChatCountToday;
  factory ChatCountToday.fromJson(Map<String, dynamic> json) =>
      _$ChatCountTodayFromJson(json);

  ChatCountToday increaced() {
    final isPremium = PurchasesController.to.isPremiumSubscribing();
    final newBasic = isPremium ? basic : basic + 1;
    final newPremium = isPremium ? premium + 1 : premium;
    return ChatCountToday(basic: newBasic, premium: newPremium);
  }

  ChatCountToday decreaced() {
    final isPremium = PurchasesController.to.isPremiumSubscribing();
    final newBasic = isPremium ? basic : basic - 1;
    final newPremium = isPremium ? premium - 1 : premium;
    return ChatCountToday(basic: newBasic, premium: newPremium);
  }
}
