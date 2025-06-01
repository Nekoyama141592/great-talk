import 'package:great_talk/model/database_schema/q_doc_info/q_doc_info.dart';
import 'package:great_talk/typedef/firestore_typedef.dart';

class DocsState {
  final List<QDocInfo> qDocInfoList;
  final List<QDoc> indexDocs;

  DocsState({
    this.qDocInfoList = const [],
    this.indexDocs = const [],
  });

  DocsState copyWith({
    List<QDocInfo>? qDocInfoList,
    List<QDoc>? indexDocs,
  }) {
    return DocsState(
      qDocInfoList: qDocInfoList ?? this.qDocInfoList,
      indexDocs: indexDocs ?? this.indexDocs,
    );
  }
}
