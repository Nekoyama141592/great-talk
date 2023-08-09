import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:great_talk/model/public_user/public_user.dart';
import 'package:great_talk/views/components/circle_image.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.publicUser}) : super(key: key);
  final PublicUser publicUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding(context)),
      child: InkWell(
        onTap: () => Get.toNamed("/users/${publicUser.uid}"),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleImage(imageValue: publicUser.typedUserImage().value),
            const Spacer(),
            Text(publicUser.typedUserName().value),
            const Spacer(),
            const Icon(Icons.people),
            Text(publicUser.followerCount.toString())
          ],
        ),
      ),
    );
  }
}
