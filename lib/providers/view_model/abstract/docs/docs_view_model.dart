import 'package:great_talk/model/q_doc_info/q_doc_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'docs_view_model.g.dart';
@riverpod
class DocsViewModel extends _$DocsViewModel {
  @override
  List<QDocInfo> build() {
    return [];
  }
}