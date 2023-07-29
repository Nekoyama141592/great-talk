import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/controllers/docs_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshScreen extends HookWidget {
  const RefreshScreen({
    Key? key,
    required this.docsController,
    required this.child,
  }) : super(key: key);
  final DocsController docsController;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    RefreshController refreshController = RefreshController();
    useEffect(() {
      refreshController = RefreshController();
      return refreshController.dispose;
    }, []);
    return SmartRefresher(
      controller: refreshController,
      enablePullDown: docsController.enablePullDown,
      enablePullUp: true,
      header: const WaterDropHeader(),
      onLoading: docsController.onLoading,
      onRefresh: docsController.onRefresh,
      child: child,
    );
  }
}