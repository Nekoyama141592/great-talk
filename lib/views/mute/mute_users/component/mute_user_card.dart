import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/texts.dart';
import 'package:great_talk/controllers/mute_users_controller.dart';
import 'package:great_talk/model/public_user/public_user.dart';
import 'package:great_talk/views/components/circle_image.dart';

class MuteUserCard extends StatelessWidget {
  const MuteUserCard(
      {Key? key, required this.passiveUser, required this.uint8list})
      : super(key: key);
  final PublicUser passiveUser;
  final Uint8List? uint8list;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MuteUsersController());
    return ListTile(
      leading: CircleImage(
        bucketName: passiveUser.typedImage().bucketName,
        imageValue: passiveUser.typedImage().value,
        uint8list: uint8list,
      ),
      title: BasicBoldText(passiveUser.typedUserName().value),
      onTap: () => controller.onTap(passiveUser.uid),
    );
  }
}
