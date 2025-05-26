import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/core/doubles.dart';
import 'package:great_talk/core/strings.dart';
import 'package:great_talk/model/database_schema/bookmark_category/bookmark_category.dart';
import 'package:great_talk/providers/global/tokens/tokens_notifier.dart';
import 'package:great_talk/ui_core/texts.dart';
import 'package:great_talk/views/common/async_screen/async_screen.dart';
import 'package:great_talk/views/components/basic_height_box.dart';
import 'package:great_talk/views/components/rounded_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookmarkCategoriesListView extends ConsumerWidget {
  const BookmarkCategoriesListView({
    super.key,
    required this.onBookmarkCategoryTapped,
  });
  final void Function(BookmarkCategory) onBookmarkCategoryTapped;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final asyncValue = ref.watch(tokensNotifierProvider);
    return SizedBox(
      height: fullHeight(context) * 0.8,
      child: Padding(
        padding: EdgeInsets.all(defaultPadding(context)),
        child: Column(
          children: [
            SizedBox(
              height: fullHeight(context) * 0.7,
              child: Material(
                child: AsyncScreen(asyncValue: asyncValue, data: (state) {
                  final bookmarkCategoryTokens = state.bookmarkCategoryTokens;
                  return ListView.builder(
                    itemCount:
                        bookmarkCategoryTokens.length,
                    itemBuilder: (context, index) {
                      final token =
                          bookmarkCategoryTokens[index];
                      return InkWell(
                        onTap: () => onBookmarkCategoryTapped(token),
                        child: ListTile(title: BasicBoldText(token.title)),
                      );
                    },
                  );
                })
              ),
            ),
            const BasicHeightBox(),
            RoundedButton(text: cancelText, press: Get.back),
          ],
        ),
      ),
    );
  }
}
