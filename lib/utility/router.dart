import 'package:get/get.dart';
import 'package:great_talk/my_app.dart';
import 'package:great_talk/views/create_post_page.dart';
import 'package:great_talk/views/mute_users_page.dart';
import 'package:great_talk/views/realtime_res_page/realtime_res_page.dart';
import 'package:great_talk/views/search_user_posts_page.dart';
import 'package:great_talk/views/user_profile_page.dart';

final getPages = [
  GetPage(name: "/", page: () => const MyApp()),
  GetPage(
    name: "/chat/users/:uid/posts/:postId",
    page: () => const RealtimeResPage(),
  ),
  GetPage(
    name: "/createPost",
    page: () => const CreatePostPage(),
  ),
  GetPage(name: "/muteUsers", page: () => const MuteUsersPage()),
  GetPage(name: "/users/:uid", page: () => const UserProfilePage()),
  GetPage(
      name: "/users/:uid/posts/search", page: () => const SearchUserPostsPage())
];
