import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_post_token.freezed.dart';
part 'report_post_token.g.dart';

@freezed
abstract class ReportPostToken implements _$ReportPostToken {
  const factory ReportPostToken({
    required String activeUid,
    required dynamic createdAt,
    required String postId,
    required dynamic postRef,
    required String tokenId,
    required String tokenType,
  }) = _ReportPostToken;
  factory ReportPostToken.fromJson(Map<String, dynamic> json) =>
      _$ReportPostTokenFromJson(json);
}
