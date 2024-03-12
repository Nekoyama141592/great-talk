import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:great_talk/common/texts.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/model/public_user/public_user.dart';
import 'package:great_talk/views/components/basic_width_box.dart';
import 'package:great_talk/views/components/circle_image/circle_image.dart';
import 'package:great_talk/views/components/mosaic_card/components/mosaic_user_child.dart';
import 'package:great_talk/views/components/mosaic_card/mosaic_card.dart';
import 'package:great_talk/views/components/official_mark.dart';
import 'package:great_talk/views/user_profile_page.dart';

class UserCard extends StatelessWidget with CurrentUserMixin {
  const UserCard(
      {super.key, required this.publicUser, required this.uint8list});
  final PublicUser publicUser;
  final Uint8List? uint8list;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(defaultPadding(context)),
        child: (publicUser.isInappropriate())
            ? SizedBox(
                height: userImageSize(context),
                child: MosaicCard(
                    child: MosaicUserChild(
                  publicUser: publicUser,
                  msg: publicUser.inappropriateReason(currentUid()),
                  title: "不適切なユーザー",
                )))
            : Obx(
                () => CurrentUserController.to.isMutingUser(publicUser.uid)
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
