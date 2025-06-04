import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:great_talk/providers/global/remote_config/remote_config_provider.dart';
import 'package:great_talk/views/accounts_page.dart';
import 'package:great_talk/views/admin_page.dart';
import 'package:great_talk/views/auth/login_page.dart';
import 'package:great_talk/views/auth/logouted_page.dart';
import 'package:great_talk/views/auth/reauthenticate_to_delete_page.dart';
import 'package:great_talk/views/auth/user_deleted_page.dart';
import 'package:great_talk/views/maintenance/maintenance_page.dart';
import 'package:great_talk/views/check_page/first_page.dart';
import 'package:great_talk/views/create_post/create_post_page.dart';
import 'package:great_talk/views/edit_page.dart';
import 'package:great_talk/views/generate_image/generate_image_page.dart';
import 'package:great_talk/views/main/subscribe/subscribe_page.dart';
import 'package:great_talk/views/mute/mute_posts/mute_posts_page.dart';
import 'package:great_talk/views/mute/mute_users/mute_users_page.dart';
import 'package:great_talk/views/chat/chat_page.dart';
import 'package:great_talk/views/user_profile_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  AppRouter(this.ref);
  final Ref ref;
  @override
  List<AutoRoute> get routes {
    final remoteConfig = ref.watch(remoteConfigNotifierProvider).value;
    final needsUpdate = remoteConfig?.needsUpdate ?? false;
    String rootPath = FirstPage.path;
    String maintenancePath = MaintenancePage.path;
    return [
      AutoRoute(
        page: MaintenanceRoute.page,
        path: needsUpdate ? rootPath : maintenancePath,
      ),
      AutoRoute(
        page: FirstRoute.page,
        path: needsUpdate ? maintenancePath : rootPath,
      ),
      AutoRoute(page: LoginRoute.page, path: LoginPage.path),
      AutoRoute(page: AccountRoute.page, path: AccountPage.path),
      AutoRoute(page: AdminRoute.page, path: AdminPage.path),
      AutoRoute(page: ChatRoute.page, path: ChatPage.path),
      AutoRoute(page: CreatePostRoute.page, path: CreatePostPage.path),
      AutoRoute(page: EditProfileRoute.page, path: EditProfilePage.path),
      AutoRoute(page: LogoutedRoute.page, path: LogoutedPage.path),
      AutoRoute(page: MuteUsersRoute.page, path: MuteUsersPage.path),
      AutoRoute(page: MutePostsRoute.page, path: MutePostsPage.path),
      AutoRoute(
        page: ReauthenticateToDeleteRoute.page,
        path: ReauthenticateToDeletePage.path,
      ),
      AutoRoute(page: SubscribeRoute.page, path: SubscribePage.path),
      AutoRoute(page: UserDeletedRoute.page, path: UserDeletedPage.path),
      AutoRoute(page: UserProfileRoute.page, path: UserProfilePage.path),
      AutoRoute(page: GenerateImageRoute.page, path: GenerateImagePage.path),
    ];
  }
}
