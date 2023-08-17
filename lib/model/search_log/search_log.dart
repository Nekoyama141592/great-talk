import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

part 'search_log.freezed.dart';
part 'search_log.g.dart';

@freezed
abstract class SearchLog implements _$SearchLog {
  const factory SearchLog({
    required dynamic logCreatedAt,
    required String searchTarget,
    required String searchTerm,
    required String uid,
  }) = _UserUpdateLog;
  factory SearchLog.fromJson(SDMap json) => _$SearchLogFromJson(json);
}
