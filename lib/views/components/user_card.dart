import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:great_talk/common/texts.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/model/public_user/public_user.dart';
import 'package:great_talk/views/components/basic_width_box.dart';
import 'package:great_talk/views/components/circle_image.dart';
import 'package:great_talk/views/components/mosaic_card.dart';

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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const BoldWhiteText("不適切なユーザー"),
                    const BasicWidthBox(),
                    InkWell(
                      onTap: () => UIHelper.simpleAlertDialog(
                          publicUser.inappropriateReason()),
                      child: const Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ))
          : Container(
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: InkWell(
                onTap: () => Get.toNamed("/users/${publicUser.uid}"),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleImage(
                        bucketName: publicUser.typedUserImage().bucketName,
                        imageValue: publicUser.typedUserImage().value),
                    const Spacer(),
                    EllipsisText(publicUser.typedUserName().value),
                    const Spacer(),
                    const Icon(Icons.people),
                    Text(publicUser.followerCount.toString())
                  ],
                ),
              ),
            ),
    );
  }
}
