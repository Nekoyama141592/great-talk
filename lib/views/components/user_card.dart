import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:great_talk/core/doubles.dart';
import 'package:great_talk/providers/global/auth/stream_auth_provider.dart';
import 'package:great_talk/ui_core/texts.dart';
import 'package:great_talk/ui_core/ui_helper.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/model/database_schema/public_user/public_user.dart';
import 'package:great_talk/views/components/basic_width_box.dart';
import 'package:great_talk/views/components/circle_image/circle_image.dart';
import 'package:great_talk/views/components/mosaic_card/components/mosaic_user_child.dart';
import 'package:great_talk/views/components/mosaic_card/mosaic_card.dart';
import 'package:great_talk/views/components/official_mark.dart';
import 'package:great_talk/views/user_profile_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserCard extends ConsumerWidget {
  const UserCard(
      {super.key, required this.publicUser, required this.uint8list});
  final PublicUser publicUser;
  final Uint8List? uint8list;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
        padding: EdgeInsets.all(defaultPadding(context)),
        child: (publicUser.isInappropriate())
            ? SizedBox(
                height: userImageSize(context),
                child: MosaicCard(
                    child: MosaicUserChild(
                  publicUser: publicUser,
                  msg: publicUser.inappropriateReason(
                      ref.watch(streamAuthUidProvider).value),
                  title: "不適切なユーザー",
                )))
            : Obx(
                () => TokensController.to.isMutingUser(publicUser.uid)
                    ? MosaicCard(
                        child: MosaicUserChild(
                            publicUser: publicUser,
                            msg: "あなたはこのユーザーをミュートしています。",
                            title: "ミュートしている"))
                    : Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: InkWell(
                          onLongPress: () async {
                            if (!CurrentUserController.to.isAdmin()) return;
                            final text =
                                "UID\n${publicUser.uid}\nユーザーの画像\n${publicUser.typedImage().value}";
                            final data = ClipboardData(text: text);
                            await Clipboard.setData(data);
                            UIHelper.showFlutterToast(
                                "${publicUser.nameValue}のUIDと画像のファイル名をコピーしました");
                          },
                          onTap: () => Get.toNamed(
                              UserProfilePage.generatePath(publicUser.uid)),
                          child: Row(
                            children: [
                              CircleImage(
                                uint8list: uint8list,
                              ),
                              const BasicWidthBox(),
                              Expanded(
                                child: EllipsisText(
                                  publicUser.nameValue,
                                ),
                              ),
                              const BasicWidthBox(),
                              const Icon(Icons.people),
                              const BasicWidthBox(),
                              BasicBoldText(
                                  publicUser.followerCount.toString()),
                              const BasicWidthBox(),
                              if (publicUser.isOfficial) const OfficialMark()
                            ],
                          ),
                        ),
                      ),
              ));
  }
}
