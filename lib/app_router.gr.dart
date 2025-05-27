// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AccountPage]
class AccountRoute extends PageRouteInfo<void> {
  const AccountRoute({List<PageRouteInfo>? children})
    : super(AccountRoute.name, initialChildren: children);

  static const String name = 'AccountRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AccountPage();
    },
  );
}

/// generated route for
/// [AdminPage]
class AdminRoute extends PageRouteInfo<void> {
  const AdminRoute({List<PageRouteInfo>? children})
    : super(AdminRoute.name, initialChildren: children);

  static const String name = 'AdminRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AdminPage();
    },
  );
}

/// generated route for
/// [ChatPage]
class ChatRoute extends PageRouteInfo<void> {
  const ChatRoute({List<PageRouteInfo>? children})
    : super(ChatRoute.name, initialChildren: children);

  static const String name = 'ChatRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChatPage();
    },
  );
}

/// generated route for
/// [CreatePostPage]
class CreatePostRoute extends PageRouteInfo<CreatePostRouteArgs> {
  CreatePostRoute({Key? key, List<PageRouteInfo>? children})
    : super(
        CreatePostRoute.name,
        args: CreatePostRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'CreatePostRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreatePostRouteArgs>(
        orElse: () => const CreatePostRouteArgs(),
      );
      return CreatePostPage(key: args.key);
    },
  );
}

class CreatePostRouteArgs {
  const CreatePostRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'CreatePostRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CreatePostRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [EditProfilePage]
class EditProfileRoute extends PageRouteInfo<void> {
  const EditProfileRoute({List<PageRouteInfo>? children})
    : super(EditProfileRoute.name, initialChildren: children);

  static const String name = 'EditProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EditProfilePage();
    },
  );
}

/// generated route for
/// [GenerateImagePage]
class GenerateImageRoute extends PageRouteInfo<void> {
  const GenerateImageRoute({List<PageRouteInfo>? children})
    : super(GenerateImageRoute.name, initialChildren: children);

  static const String name = 'GenerateImageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const GenerateImagePage();
    },
  );
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginPage();
    },
  );
}

/// generated route for
/// [LogoutedPage]
class LogoutedRoute extends PageRouteInfo<void> {
  const LogoutedRoute({List<PageRouteInfo>? children})
    : super(LogoutedRoute.name, initialChildren: children);

  static const String name = 'LogoutedRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LogoutedPage();
    },
  );
}

/// generated route for
/// [MutePostsPage]
class MutePostsRoute extends PageRouteInfo<void> {
  const MutePostsRoute({List<PageRouteInfo>? children})
    : super(MutePostsRoute.name, initialChildren: children);

  static const String name = 'MutePostsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MutePostsPage();
    },
  );
}

/// generated route for
/// [MuteUsersPage]
class MuteUsersRoute extends PageRouteInfo<void> {
  const MuteUsersRoute({List<PageRouteInfo>? children})
    : super(MuteUsersRoute.name, initialChildren: children);

  static const String name = 'MuteUsersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MuteUsersPage();
    },
  );
}

/// generated route for
/// [MyAppPage]
class MyAppRoute extends PageRouteInfo<void> {
  const MyAppRoute({List<PageRouteInfo>? children})
    : super(MyAppRoute.name, initialChildren: children);

  static const String name = 'MyAppRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MyAppPage();
    },
  );
}

/// generated route for
/// [ReauthenticateToDeletePage]
class ReauthenticateToDeleteRoute extends PageRouteInfo<void> {
  const ReauthenticateToDeleteRoute({List<PageRouteInfo>? children})
    : super(ReauthenticateToDeleteRoute.name, initialChildren: children);

  static const String name = 'ReauthenticateToDeleteRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ReauthenticateToDeletePage();
    },
  );
}

/// generated route for
/// [SubscribePage]
class SubscribeRoute extends PageRouteInfo<void> {
  const SubscribeRoute({List<PageRouteInfo>? children})
    : super(SubscribeRoute.name, initialChildren: children);

  static const String name = 'SubscribeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SubscribePage();
    },
  );
}

/// generated route for
/// [UserDeletedPage]
class UserDeletedRoute extends PageRouteInfo<void> {
  const UserDeletedRoute({List<PageRouteInfo>? children})
    : super(UserDeletedRoute.name, initialChildren: children);

  static const String name = 'UserDeletedRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UserDeletedPage();
    },
  );
}

/// generated route for
/// [UserProfilePage]
class UserProfileRoute extends PageRouteInfo<void> {
  const UserProfileRoute({List<PageRouteInfo>? children})
    : super(UserProfileRoute.name, initialChildren: children);

  static const String name = 'UserProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UserProfilePage();
    },
  );
}
