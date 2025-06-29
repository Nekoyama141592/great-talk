import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:great_talk/core/util/size_util.dart';
import 'package:great_talk/presentation/constant/remote_config_constants.dart';
import 'package:great_talk/presentation/notifier/admin/admin_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class AdminPage extends HookConsumerWidget {
  const AdminPage({super.key});
  static const path = "/admin";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(adminViewModelProvider);
    const style = TextStyle(fontSize: 20.0);
    return Scaffold(
      appBar: AppBar(title: const Text("管理者専用ページ")),
      body: Padding(
        padding: EdgeInsets.all(SizeUtil.defaultPadding(context)),
        child: asyncValue.when(
          data:
              (state) => ListView(
                children: [
                  const SelectableText(
                    "アプリバージョン: ${RemoteConfigConstants.appVersion}",
                  ),
                  SelectableText("登録ユーザー数 ${state.userCount}", style: style),
                  const Divider(),
                  SelectableText("累計ポスト数 ${state.postCount}", style: style),
                  const Divider(),
                  SelectableText(
                    "累計メッセージ数 ${state.messageCount}",
                    style: style,
                  ),
                ],
              ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, st) => Center(child: Text('エラーが発生しました: $e')),
        ),
      ),
    );
  }
}
