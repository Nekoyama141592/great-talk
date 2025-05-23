import 'package:flutter/material.dart';
import 'package:great_talk/core/doubles.dart';
import 'package:great_talk/consts/remote_config_constants.dart';
import 'package:great_talk/providers/view_model/admin/admin_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AdminPage extends HookConsumerWidget {
  const AdminPage({
    super.key,
  });
  static const path = "/admin";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(adminViewModelProvider);
    const style = TextStyle(fontSize: 20.0);
    return Scaffold(
      appBar: AppBar(
        title: const Text("管理者専用ページ"),
      ),
      body: Padding(
        padding: EdgeInsets.all(defaultPadding(context)),
        child: asyncValue.when(
          data: (state) => ListView(
            children: [
              const SelectableText(
                "アプリバージョン: ${RemoteConfigConstants.appVersion}",
              ),
              SelectableText(
                "登録ユーザー数 ${state.userCount}",
                style: style,
              ),
              const Divider(),
              SelectableText(
                "累計ポスト数 ${state.postCount}",
                style: style,
              ),
              const Divider(),
              SelectableText(
                "累計メッセージ数 ${state.messageCount}",
                style: style,
              ),
              const Divider(),
              SelectableText(
                "累計検索数 ${state.searchCount}",
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
