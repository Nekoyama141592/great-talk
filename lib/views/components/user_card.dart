import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:great_talk/common/texts.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/model/public_user/public_user.dart';
import 'package:great_talk/utility/style_utility.dart';
import 'package:great_talk/views/components/circle_image.dart';
import 'package:great_talk/views/components/mosaic_card/components/mosaic_user_child.dart';
import 'package:great_talk/views/components/mosaic_card/mosaic_card.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.publicUser}) : super(key: key);
  final PublicUser publicUser;

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
                  msg: publicUser.inappropriateReason(),
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
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: InkWell(
                          onTap: () => Get.toNamed("/users/${publicUser.uid}"),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleImage(
                                  bucketName:
                                      publicUser.typedUserImage().bucketName,
                                  imageValue:
                                      publicUser.typedUserImage().value),
                              const Spacer(),
                              EllipsisText(
                                publicUser.typedUserName().value,
                                style: StyleUtility.bold25(),
                              ),
                              const Spacer(),
                              const Icon(Icons.people),
                              BasicBoldText(publicUser.followerCount.toString())
                            ],
                          ),
                        ),
                      ),
              ));
  }
}
