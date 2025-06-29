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
class ChatRoute extends PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    Key? key,
    String uid = '',
    String postId = '',
    List<PageRouteInfo>? children,
  }) : super(
         ChatRoute.name,
         args: ChatRouteArgs(key: key, uid: uid, postId: postId),
         rawPathParams: {'uid': uid, 'postId': postId},
         initialChildren: children,
       );

  static const String name = 'ChatRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ChatRouteArgs>(
        orElse:
            () => ChatRouteArgs(
              uid: pathParams.getString('uid', ''),
              postId: pathParams.getString('postId', ''),
            ),
      );
      return ChatPage(key: args.key, uid: args.uid, postId: args.postId);
    },
  );
}

class ChatRouteArgs {
  const ChatRouteArgs({this.key, this.uid = '', this.postId = ''});

  final Key? key;

  final String uid;

  final String postId;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key, uid: $uid, postId: $postId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ChatRouteArgs) return false;
    return key == other.key && uid == other.uid && postId == other.postId;
  }

  @override
  int get hashCode => key.hashCode ^ uid.hashCode ^ postId.hashCode;
}

/// generated route for
/// [CreatePostPage]
class CreatePostRoute extends PageRouteInfo<void> {
  const CreatePostRoute({List<PageRouteInfo>? children})
    : super(CreatePostRoute.name, initialChildren: children);

  static const String name = 'CreatePostRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CreatePostPage();
    },
  );
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
/// [EmailAuthPage]
class EmailAuthRoute extends PageRouteInfo<void> {
  const EmailAuthRoute({List<PageRouteInfo>? children})
    : super(EmailAuthRoute.name, initialChildren: children);

  static const String name = 'EmailAuthRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EmailAuthPage();
    },
  );
}

/// generated route for
/// [FirstPage]
class FirstRoute extends PageRouteInfo<void> {
  const FirstRoute({List<PageRouteInfo>? children})
    : super(FirstRoute.name, initialChildren: children);

  static const String name = 'FirstRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FirstPage();
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
/// [MaintenancePage]
class MaintenanceRoute extends PageRouteInfo<void> {
  const MaintenanceRoute({List<PageRouteInfo>? children})
    : super(MaintenanceRoute.name, initialChildren: children);

  static const String name = 'MaintenanceRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MaintenancePage();
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
class UserProfileRoute extends PageRouteInfo<UserProfileRouteArgs> {
  UserProfileRoute({Key? key, String uid = '', List<PageRouteInfo>? children})
    : super(
        UserProfileRoute.name,
        args: UserProfileRouteArgs(key: key, uid: uid),
        rawPathParams: {'uid': uid},
        initialChildren: children,
      );

  static const String name = 'UserProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<UserProfileRouteArgs>(
        orElse:
            () => UserProfileRouteArgs(uid: pathParams.getString('uid', '')),
      );
      return UserProfilePage(key: args.key, uid: args.uid);
    },
  );
}

class UserProfileRouteArgs {
  const UserProfileRouteArgs({this.key, this.uid = ''});

  final Key? key;

  final String uid;

  @override
  String toString() {
    return 'UserProfileRouteArgs{key: $key, uid: $uid}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! UserProfileRouteArgs) return false;
    return key == other.key && uid == other.uid;
  }

  @override
  int get hashCode => key.hashCode ^ uid.hashCode;
}

/// generated route for
/// [VerifyEmailPage]
class VerifyEmailRoute extends PageRouteInfo<void> {
  const VerifyEmailRoute({List<PageRouteInfo>? children})
    : super(VerifyEmailRoute.name, initialChildren: children);

  static const String name = 'VerifyEmailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const VerifyEmailPage();
    },
  );
}
