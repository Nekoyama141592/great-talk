import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/model/database_schema/q_doc_info/q_doc_info.dart';
import 'package:great_talk/views/components/post_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshScreen extends HookWidget {
  const RefreshScreen({
    super.key,
    required this.qDocInfoList,
    required this.onLoading,
  });
  final List<QDocInfo> qDocInfoList;
  final void Function(RefreshController) onLoading;
  @override
  Widget build(BuildContext context) {
    RefreshController refreshController = RefreshController();
    useEffect(() {
      refreshController = RefreshController();
      return refreshController.dispose;
    }, []);
    if (qDocInfoList.isEmpty) {
      return Align(alignment: Alignment.center, child: const Text('データがありません'));
    }
    return SmartRefresher(
      controller: refreshController,
      enablePullDown: false, // trueだとiosもAndroidも反応しなくなる
      enablePullUp: true,
      header: const WaterDropHeader(),
      onLoading: () => onLoading(refreshController),
      child:
          GridView.builder(
            itemCount: qDocInfoList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.5,
            ),
            itemBuilder: (c, i) {
              final qDocInfo = qDocInfoList[i];
              return PostCard(post: Post.fromJson(qDocInfo.qDoc.data()),base64: base64Encode(qDocInfo.userImage!),publicUser: qDocInfo.publicUser,);
            },
          ),
    );
  }
}
