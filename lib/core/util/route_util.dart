import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:great_talk/domain/entity/database/post/post_entity.dart';
import 'package:great_talk/presentation/page/chat/chat_page.dart';
import 'package:great_talk/presentation/page/check_page/first_page.dart';

class RouteUtil {
  static void pushReplace(BuildContext context) {
    context.router.replacePath(FirstPage.path);
  }

  static void pushPath(BuildContext context, String path) {
    context.router.pushPath(path);
  }

  static void back(BuildContext context) {
    context.router.back();
  }

  static void toChatPage(BuildContext context, PostEntity post) {
    pushPath(context, ChatPage.generatePath(post.uid, post.postId));
  }
}
