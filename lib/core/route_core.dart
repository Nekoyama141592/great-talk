import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:great_talk/domain/database_schema/post/post.dart';
import 'package:great_talk/presentation/page/chat/chat_page.dart';

class RouteCore {
  static void pushPath(BuildContext context, String path) {
    context.router.pushPath(path);
  }

  static void back(BuildContext context) {
    context.router.back();
  }

  static void toChatPage(BuildContext context, Post post) {
    pushPath(context, ChatPage.generatePath(post.uid, post.postId));
  }
}
