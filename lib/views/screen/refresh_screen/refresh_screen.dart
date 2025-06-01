import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/model/view_model_state/docs/docs_state.dart';
import 'package:great_talk/views/components/post_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshScreen extends HookWidget {
  const RefreshScreen({
    super.key,
    required this.state,
    this.reloadMsg,
    required this.onLoading,
    this.child,
  });
  final DocsState state;
  final String? reloadMsg;
  final void Function(RefreshController) onLoading;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    RefreshController refreshController = RefreshController();
    useEffect(() {
      refreshController = RefreshController();
      return refreshController.dispose;
    }, []);
    final qDocInfoList = state.qDocInfoList;
    if (qDocInfoList.isEmpty) {
      return Align(alignment: Alignment.center,child: const Text('データがありません'),);
    }
    return SmartRefresher(
      controller: refreshController,
      enablePullDown: false, // trueだとiosもAndroidも反応しなくなる
      enablePullUp: true,
      header: const WaterDropHeader(),
      onLoading: () => onLoading(refreshController),
      child:
          child ??
          GridView.builder(
            itemCount: qDocInfoList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.5,
            ),
            itemBuilder: (c, i) {
              final qDocInfo = qDocInfoList[i];
              return PostCard(qDocInfo: qDocInfo);
            },
          ),
    );
  }
}
