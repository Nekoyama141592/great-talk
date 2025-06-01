import 'package:flutter/material.dart';
import 'package:great_talk/core/router_core.dart';
import 'package:great_talk/model/view_model_state/docs/docs_state.dart';
import 'package:great_talk/providers/global/auth/stream_auth_provider.dart';
import 'package:great_talk/providers/global/tokens/tokens_notifier.dart';
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
import 'package:great_talk/views/screen/refresh_screen/refresh_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({
    super.key,
    required this.state,
    required this.onReload,
    required this.onLoading,
    required this.follow,
    required this.unFollow,
  });
  final DocsState state;
  final void Function()? onReload;
  final void Function(RefreshController) onLoading;
  final void Function()? follow;
  final void Function()? unFollow;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passiveUser = state.passiveUser;
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
          CircleImage(uint8list: state.uint8list),
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
                          .contains(state.passiveUid()) ??
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
      child: RefreshScreen(
        state: state,
        onReload: onReload,
        onLoading: onLoading,
      ),
    );
  }
}
