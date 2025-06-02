import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:great_talk/core/router_core.dart';
import 'package:great_talk/model/view_model_state/profile/profile_state.dart';
import 'package:great_talk/providers/global/auth/stream_auth_provider.dart';
import 'package:great_talk/providers/global/tokens/tokens_notifier.dart';
import 'package:great_talk/providers/view_model/refresh_interface.dart';
import 'package:great_talk/ui_core/texts.dart';
import 'package:great_talk/extension/number_format_extension.dart';
import 'package:great_talk/extension/string_extension.dart';
import 'package:great_talk/ui_core/style_utility.dart';
import 'package:great_talk/views/components/basic_width_box.dart';
import 'package:great_talk/views/components/circle_image/circle_image.dart';
import 'package:great_talk/views/components/official_mark.dart';
import 'package:great_talk/views/screen/gradient_screen.dart';
import 'package:great_talk/views/screen/profile_screen/components/edit_button.dart';
import 'package:great_talk/views/screen/profile_screen/components/follow_button.dart';
import 'package:great_talk/views/screen/refresh_screen/posts_refresh_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({
    super.key,
    required this.state,
    required this.passiveUid,
    required this.notifier,
    required this.follow,
    required this.unFollow,
  });
  final ProfileState state;
  final String passiveUid;
  final RefreshInterface Function() notifier;
  final void Function()? follow;
  final void Function()? unFollow;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passiveUser = state.user;
    final image = state.base64;
    final children = <Widget>[
      Align(
        alignment: Alignment.centerLeft,
        child: InkWell(
          onTap: () => RouterCore.back(context),
          child: const Icon(Icons.arrow_back, size: 30.0),
        ),
      ),
      EllipsisText(passiveUser?.nameValue ?? '', style: StyleUiCore.bold25()),
      Row(
        children: [
          if (image != null) CircleImage(uint8list: base64Decode(image)),
          const BasicWidthBox(),
          Text("フォロー ${passiveUser?.followingCount.formatNumber() ?? 0}"),
          const BasicWidthBox(),
          Text("フォロワー ${passiveUser?.followerCount.formatNumber() ?? 0}"),
        ],
      ),
      // 横向きなら、表示崩れを防止するためにbioを表示しない。
      if (MediaQuery.of(context).orientation != Orientation.landscape)
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            passiveUser?.typedBio().value.removeNewlinesAndSpaces() ?? '',
          ),
        ),
      if ((passiveUser?.isOfficial ?? false)) const OfficialMark(),
    ];
    return GradientScreen(
      header: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (passiveUser != null) ...children,
              Builder(
                builder: (context) {
                  final isFollow =
                      ref
                          .watch(tokensNotifierProvider)
                          .value
                          ?.followingUids
                          .contains(passiveUid) ??
                      false;
                  return passiveUser?.uid ==
                          ref.watch(streamAuthUidProvider).value
                      ? const EditButton()
                      : FollowButton(
                        isFollow: isFollow,
                        follow: follow,
                        unFollow: unFollow,
                      );
                },
              ),
            ],
          ),
        ),
      ),
      child: PostsRefreshScreen(userPosts: state.userPosts, notifier: notifier,)
    );
  }
}
