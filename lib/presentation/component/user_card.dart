import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:great_talk/core/size_core.dart';
import 'package:great_talk/core/route_core.dart';
import 'package:great_talk/provider/keep_alive/stream/auth/stream_auth_provider.dart';
import 'package:great_talk/provider/keep_alive/notifier/tokens/tokens_notifier.dart';
import 'package:great_talk/ui_core/texts.dart';
import 'package:great_talk/domain/entity/public_user/public_user.dart';
import 'package:great_talk/presentation/page/common/async_page/async_screen/async_screen.dart';
import 'package:great_talk/presentation/component/basic_width_box.dart';
import 'package:great_talk/presentation/component/circle_image/circle_image.dart';
import 'package:great_talk/presentation/component/mosaic_card/components/mosaic_user_child.dart';
import 'package:great_talk/presentation/component/mosaic_card/mosaic_card.dart';
import 'package:great_talk/presentation/component/official_mark.dart';
import 'package:great_talk/presentation/page/user_profile_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserCard extends ConsumerWidget {
  const UserCard({
    super.key,
    required this.publicUser,
    required this.uint8list,
  });
  final PublicUser publicUser;
  final Uint8List? uint8list;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(tokensNotifierProvider);
    return Padding(
      padding: EdgeInsets.all(SizeCore.defaultPadding(context)),
      child:
          (publicUser.isInappropriate())
              ? SizedBox(
                height: SizeCore.userImageSize(context),
                child: MosaicCard(
                  child: MosaicUserChild(
                    publicUser: publicUser,
                    msg: publicUser.inappropriateReason(
                      ref.watch(streamAuthUidProvider).value,
                    ),
                    title: "不適切なユーザー",
                  ),
                ),
              )
              : AsyncScreen(
                asyncValue: asyncValue,
                data:
                    (state) =>
                        state.isMutingUser(publicUser.uid)
                            ? MosaicCard(
                              child: MosaicUserChild(
                                publicUser: publicUser,
                                msg: "あなたはこのユーザーをミュートしています。",
                                title: "ミュートしている",
                              ),
                            )
                            : Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 16.0,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: InkWell(
                                onTap:
                                    () => RouteCore.pushPath(
                                      context,
                                      UserProfilePage.generatePath(
                                        publicUser.uid,
                                      ),
                                    ),
                                child: Row(
                                  children: [
                                    CircleImage(uint8list: uint8list),
                                    const BasicWidthBox(),
                                    Expanded(
                                      child: EllipsisText(publicUser.nameValue),
                                    ),
                                    const BasicWidthBox(),
                                    const Icon(Icons.people),
                                    const BasicWidthBox(),
                                    BasicBoldText(
                                      publicUser.followerCount.toString(),
                                    ),
                                    const BasicWidthBox(),
                                    if (publicUser.isOfficial)
                                      const OfficialMark(),
                                  ],
                                ),
                              ),
                            ),
              ),
    );
  }
}
