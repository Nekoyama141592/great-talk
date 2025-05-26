import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_state.freezed.dart';
part 'edit_state.g.dart';

@freezed
abstract class EditState with _$EditState {
  const factory EditState({
    required String bio,
    required String userName,
    required String base64,
    @Default(false) bool isPicked,
  }) = _EditState;
  factory EditState.fromJson(Map<String, dynamic> json) =>
      _$EditStateFromJson(json);
}
