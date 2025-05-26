import 'package:great_talk/model/database_schema/q_doc_info/q_doc_info.dart';
import 'package:great_talk/model/database_schema/public_user/public_user.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';
import 'dart:typed_data';

class DocsState {
  final bool isLoading;
  final List<QDocInfo> qDocInfoList;
  final List<QDoc> indexDocs;
  final PublicUser? passiveUser;
  final Uint8List? uint8list;
  final bool isTimeline; // 追加

  DocsState({
    this.isLoading = false,
    this.qDocInfoList = const [],
    this.indexDocs = const [],
    this.passiveUser,
    this.uint8list,
    this.isTimeline = false, // 追加
  });

  DocsState copyWith({
    bool? isLoading,
    List<QDocInfo>? qDocInfoList,
    List<QDoc>? indexDocs,
    PublicUser? passiveUser,
    Uint8List? uint8list,
    bool? isTimeline, // 追加
  }) {
    return DocsState(
      isLoading: isLoading ?? this.isLoading,
      qDocInfoList: qDocInfoList ?? this.qDocInfoList,
      indexDocs: indexDocs ?? this.indexDocs,
      passiveUser: passiveUser ?? this.passiveUser,
      uint8list: uint8list ?? this.uint8list,
      isTimeline: isTimeline ?? this.isTimeline, // 追加
    );
  }
}
