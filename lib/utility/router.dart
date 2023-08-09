import 'package:get/get.dart';
import 'package:great_talk/my_app.dart';
import 'package:great_talk/views/accounts_page.dart';
import 'package:great_talk/views/auth/logouted_page.dart';
import 'package:great_talk/views/auth/reauthenticate_to_delete_page.dart';
import 'package:great_talk/views/auth/user_deleted_page.dart';
import 'package:great_talk/views/create_post/create_post_page.dart';
import 'package:great_talk/views/edit_page.dart';
import 'package:great_talk/views/mute_posts_page.dart';
import 'package:great_talk/views/mute_users_page.dart';
import 'package:great_talk/views/realtime_res_page/realtime_res_page.dart';
import 'package:great_talk/views/search_user_posts_page.dart';
import 'package:great_talk/views/user_profile_page.dart';

final getPages = [
  GetPage(name: "/", page: () => const MyApp()),
  GetPage(name: "/account", page: () => const AccountPage()),
  GetPage(name: "/edit", page: () => const EditProfilePage()),
  GetPage(
    name: "/chat/users/:uid/posts/:postId",
    page: () => const RealtimeResPage(),
  ),
  GetPage(
    name: "/createPost",
    page: () => const CreatePostPage(),
  ),
  GetPage(name: "/logouted", page: () => const LogoutedPage()),
  GetPage(name: "/muteUsers", page: () => const MuteUsersPage()),
  GetPage(name: "/mutePosts", page: () => const MutePostsPage()),
  GetPage(
      name: "/reauthenticate/delete",
      page: () => const ReauthenticateToDeletePage()),
  GetPage(name: "/userDeleted", page: () => const UserDeletedPage()),
  GetPage(name: "/users/:uid", page: () => const UserProfilePage()),
  GetPage(
      name: "/users/:uid/posts/search", page: () => const SearchUserPostsPage())
];
