import 'package:get/get.dart';
import 'package:great_talk/my_app.dart';
import 'package:great_talk/views/accounts_page.dart';
import 'package:great_talk/views/admin_page.dart';
import 'package:great_talk/views/auth/logouted_page.dart';
import 'package:great_talk/views/auth/reauthenticate_to_delete_page.dart';
import 'package:great_talk/views/auth/user_deleted_page.dart';
import 'package:great_talk/views/bookmark_categories_page.dart';
import 'package:great_talk/views/bookmarks_page.dart';
import 'package:great_talk/views/create_post/create_post_page.dart';
import 'package:great_talk/views/edit_page.dart';
import 'package:great_talk/views/generate_image/generate_image_page.dart';
import 'package:great_talk/views/main/subscribe/subscribe_page.dart';
import 'package:great_talk/views/mute/mute_posts/mute_posts_page.dart';
import 'package:great_talk/views/mute/mute_users/mute_users_page.dart';
import 'package:great_talk/views/original_contents_page.dart';
import 'package:great_talk/views/realtime_res_page/realtime_res_page.dart';
import 'package:great_talk/views/search_user_posts_page.dart';
import 'package:great_talk/views/user_profile_page.dart';

final getPages = [
  GetPage(name: MyApp.path, page: () => const MyApp()),
  GetPage(name: AccountPage.path, page: () => const AccountPage()),
  GetPage(name: AdminPage.path, page: () => const AdminPage()),
  GetPage(
      name: BookmarkCategoriesPage.path,
      page: () => const BookmarkCategoriesPage()),
  GetPage(name: BookmarksPage.path, page: () => const BookmarksPage()),
  GetPage(
    name: RealtimeResPage.path,
    page: () => const RealtimeResPage(),
  ),
  GetPage(
    name: CreatePostPage.path,
    page: () => const CreatePostPage(),
  ),
  GetPage(name: EditProfilePage.path, page: () => const EditProfilePage()),
  GetPage(name: LogoutedPage.path, page: () => const LogoutedPage()),
  GetPage(name: MuteUsersPage.path, page: () => const MuteUsersPage()),
  GetPage(name: MutePostsPage.path, page: () => const MutePostsPage()),
  GetPage(
      name: OriginalContentsPage.path,
      page: () => const OriginalContentsPage()),
  GetPage(
      name: ReauthenticateToDeletePage.path,
      page: () => const ReauthenticateToDeletePage()),
  GetPage(name: SubscribePage.path, page: () => const SubscribePage()),
  GetPage(name: UserDeletedPage.path, page: () => const UserDeletedPage()),
  GetPage(name: UserProfilePage.path, page: () => const UserProfilePage()),
  GetPage(
      name: SearchUserPostsPage.path, page: () => const SearchUserPostsPage()),
  GetPage(name: GenerateImagePage.path, page: () => const GenerateImagePage()),
];
