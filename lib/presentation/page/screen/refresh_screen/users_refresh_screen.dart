import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/infrastructure/repository/result/result.dart';
import 'package:great_talk/ui_core/toast_ui_core.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsersRefreshScreen extends HookWidget {
  const UsersRefreshScreen({
    super.key,
    required this.isEmpty,
    required this.onLoading,
    required this.child,
  });
  final bool isEmpty;
  final FutureResult<bool> Function() onLoading;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    RefreshController refreshController = RefreshController();
    useEffect(() {
      refreshController = RefreshController();
      return refreshController.dispose;
    }, []);
    if (isEmpty) {
      return Align(alignment: Alignment.center, child: const Text('データがありません'));
    }
    return SmartRefresher(
      controller: refreshController,
      enablePullDown: false, // trueだとiosもAndroidも反応しなくなる
      enablePullUp: true,
      header: const WaterDropHeader(),
      onLoading: () async {
        final result = await onLoading();
        result.when(
          success:
              (_) => ToastUiCore.showSuccessSnackBar(context, '追加の読み込みが完了しました'),
          failure:
              (_) => ToastUiCore.showFailureSnackBar(context, '追加の読み込みが失敗しました'),
        );
        refreshController.loadComplete();
      },
      child: child,
    );
  }
}
