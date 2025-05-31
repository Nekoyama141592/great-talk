import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_state.freezed.dart';
part 'admin_state.g.dart';

@freezed
abstract class AdminState with _$AdminState {
  const factory AdminState({
    required int userCount,
    required int postCount,
    required int messageCount,
  }) = _AdminState;
  factory AdminState.fromJson(Map<String, dynamic> json) =>
      _$AdminStateFromJson(json);
}
