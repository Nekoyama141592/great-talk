import 'package:flutter/material.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/providers/view_model/docs/docs_view_model.dart';
import 'package:great_talk/views/common/async_screen/async_screen.dart';
import 'package:great_talk/views/components/basic_page.dart';
import 'package:great_talk/views/screen/refresh_screen/refresh_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookmarksPage extends ConsumerWidget {
  const BookmarksPage({super.key});
  static const path = "/bookmarks/:categoryId";
  static String generatePath(String categoryId) => "/bookmarks/$categoryId";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(docsViewModelProvider(DocsType.bookmarks));
    final notifier = ref.read(docsViewModelProvider(DocsType.bookmarks).notifier);
    return BasicPage(
      appBarText: "投稿一覧",
      child: AsyncScreen(asyncValue: asyncValue, data: (state) {
        return RefreshScreen(state: state, onReload: notifier.onReload, onLoading:notifier.onLoading);
      })
    );
  }
}
