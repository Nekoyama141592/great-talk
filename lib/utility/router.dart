import 'package:get/get.dart';
import 'package:great_talk/views/accounts_page.dart';
import 'package:great_talk/views/admin_page.dart';
import 'package:great_talk/views/auth/login_page.dart';
import 'package:great_talk/views/auth/logouted_page.dart';
import 'package:great_talk/views/auth/reauthenticate_to_delete_page.dart';
import 'package:great_talk/views/auth/user_deleted_page.dart';
import 'package:great_talk/views/check_page/first_page.dart';
import 'package:great_talk/views/create_post/create_post_page.dart';
import 'package:great_talk/views/edit_page.dart';
import 'package:great_talk/views/generate_image/generate_image_page.dart';
import 'package:great_talk/views/main/subscribe/subscribe_page.dart';
import 'package:great_talk/views/mute/mute_posts/mute_posts_page.dart';
import 'package:great_talk/views/mute/mute_users/mute_users_page.dart';
import 'package:great_talk/views/chat/chat_page.dart';
import 'package:great_talk/views/user_profile_page.dart';

final getPages = [
  GetPage(name: FirstPage.path, page: () => FirstPage()),
  GetPage(name: LoginPage.path, page: () => const LoginPage()),
  GetPage(name: AccountPage.path, page: () => const AccountPage()),
  GetPage(name: AdminPage.path, page: () => const AdminPage()),
  GetPage(name: ChatPage.path, page: () => const ChatPage()),
  GetPage(name: CreatePostPage.path, page: () => CreatePostPage()),
  GetPage(name: EditProfilePage.path, page: () => const EditProfilePage()),
  GetPage(name: LogoutedPage.path, page: () => const LogoutedPage()),
  GetPage(name: MuteUsersPage.path, page: () => const MuteUsersPage()),
  GetPage(name: MutePostsPage.path, page: () => const MutePostsPage()),
  GetPage(
    name: ReauthenticateToDeletePage.path,
    page: () => const ReauthenticateToDeletePage(),
  ),
  GetPage(name: SubscribePage.path, page: () => const SubscribePage()),
  GetPage(name: UserDeletedPage.path, page: () => const UserDeletedPage()),
  GetPage(name: UserProfilePage.path, page: () => const UserProfilePage()),
  GetPage(name: GenerateImagePage.path, page: () => const GenerateImagePage()),
];
