import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_report.freezed.dart';
part 'post_report.g.dart';

@freezed
abstract class PostReport implements _$PostReport {
  const factory PostReport({
    required String activeUid,
    required dynamic activeUserRef,
    required dynamic createdAt,
    required String others,
    required dynamic postRef,
    required List<String> reportContents,
  }) = _PostReport;

  factory PostReport.fromJson(Map<String, dynamic> json) =>
      _$PostReportFromJson(json);
}
