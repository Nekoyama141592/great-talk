import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/views/components/basic_page.dart';
import 'package:great_talk/views/components/rounded_input_field.dart';

class BookmarkCategoriesPage extends HookWidget {
  const BookmarkCategoriesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final inputController = useTextEditingController();
    final controller = CurrentUserController.to;
    return BasicPage(
        appBarText: "ブックマークカテゴリー",
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Obx(() => SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: fullHeight(context) * 0.7,
                      child: ListView.builder(
                          itemCount: controller.bookmarkCategoryTokens.length,
                          itemBuilder: (context, index) {
                            final token =
                                controller.bookmarkCategoryTokens[index];
                            return ListTile(
                              title: Text(token.categoryName),
                              trailing: InkWell(
                                onTap: () => controller
                                    .onBookmarkCategoryDeleteButtonPressed(
                                        token),
                                child: const Icon(Icons.delete),
                              ),
                            );
                          }),
                    ),
                    RoundedInputField(
                        controller: inputController,
                        send: () => controller.createBookmarkCategory(
                            context, inputController))
                  ],
                ),
              )),
        ));
  }
}
