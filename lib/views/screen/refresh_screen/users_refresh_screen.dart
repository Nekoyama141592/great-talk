import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/model/database_schema/public_user/public_user.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsersRefreshScreen extends HookWidget {
  const UsersRefreshScreen({
    super.key,
    required this.users,
    required this.onLoading,
    required this.child
  });
  final List<PublicUser> users;
  final void Function(RefreshController) onLoading;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    RefreshController refreshController = RefreshController();
    useEffect(() {
      refreshController = RefreshController();
      return refreshController.dispose;
    }, []);
    if (users.isEmpty) {
      return Align(alignment: Alignment.center, child: const Text('データがありません'));
    }
    return SmartRefresher(
      controller: refreshController,
      enablePullDown: false, // trueだとiosもAndroidも反応しなくなる
      enablePullUp: true,
      header: const WaterDropHeader(),
      onLoading: () => onLoading(refreshController),
      child: child
    );
  }
}
