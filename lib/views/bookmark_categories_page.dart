import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:great_talk/core/doubles.dart';
import 'package:great_talk/providers/global/tokens/tokens_notifier.dart';
import 'package:great_talk/views/bookmarks_page.dart';
import 'package:great_talk/views/common/async_screen/async_screen.dart';
import 'package:great_talk/views/components/basic_page.dart';
import 'package:great_talk/views/components/rounded_input_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookmarkCategoriesPage extends ConsumerWidget {
  const BookmarkCategoriesPage({super.key});
  static const path = "/bookmarkCategory";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputController = useTextEditingController();
    final asyncValue = ref.watch(tokensNotifierProvider);
    final notifier = ref.watch(tokensNotifierProvider.notifier);
    return BasicPage(
      appBarText: "ブックマークカテゴリー",
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: AsyncScreen(
          asyncValue: asyncValue,
          data: (state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: fullHeight(context) * 0.7,
                    child: ListView.builder(
                      itemCount: state.bookmarkCategoryTokens.length,
                      itemBuilder: (context, index) {
                        final category = state.bookmarkCategoryTokens[index];
                        return ListTile(
                          onTap:
                              () => Get.toNamed(
                                BookmarksPage.generatePath(category.id),
                              ),
                          title: Text(category.title),
                          trailing: InkWell(
                            onTap:
                                () => notifier
                                    .onBookmarkCategoryDeleteButtonPressed(
                                      category,
                                    ),
                            child: const Icon(Icons.delete),
                          ),
                        );
                      },
                    ),
                  ),
                  RoundedInputField(
                    controller: inputController,
                    send:
                        () => notifier.createBookmarkCategory(
                          context,
                          inputController,
                        ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
